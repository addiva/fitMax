import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/training_program.dart';
import '../../../core/models/workout_session.dart';
import '../../../core/providers/session_repository_provider.dart';
import '../../programs/providers/programs_providers.dart';

final sessionHistoryProvider = StreamProvider<List<WorkoutSession>>((ref) {
  final repository = ref.watch(sessionRepositoryProvider);
  return repository.watchSessions();
});

final suggestedSessionProvider = Provider<SessionSuggestion?>((ref) {
  final programs = ref.watch(programsStreamProvider).asData?.value;
  final sessions = ref.watch(sessionHistoryProvider).asData?.value;
  if (programs == null || programs.isEmpty) {
    return null;
  }
  final history = sessions ?? const [];

  WorkoutProgram selectedProgram =
      ref.watch(selectedProgramProvider) ?? programs.first;
  final lastSession = history.firstWhereOrNull(
    (session) => session.programId == selectedProgram.id,
  );
  final nextWeek = ((lastSession?.week ?? 0) % selectedProgram.weeks.total) + 1;

  return SessionSuggestion(
    program: selectedProgram,
    week: nextWeek,
    lastSession: lastSession,
  );
});

class SessionSuggestion {
  SessionSuggestion({
    required this.program,
    required this.week,
    this.lastSession,
  });

  final WorkoutProgram program;
  final int week;
  final WorkoutSession? lastSession;
}
