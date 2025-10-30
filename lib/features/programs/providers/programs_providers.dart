import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/training_program.dart';
import '../../../core/providers/program_repository_provider.dart';

/// A provider that ensures the initial programs are imported.
final programsBootstrapProvider = FutureProvider<void>((ref) async {
  final repo = ref.watch(programRepositoryProvider);
  await repo.ensureInitialProgramsImported();
});

/// A provider that exposes a stream of all programs.
final programsStreamProvider = StreamProvider<List<WorkoutProgram>>((ref) {
  final repo = ref.watch(programRepositoryProvider);
  return repo.watchPrograms();
});

/// A provider that exposes the ID of the selected program.
final selectedProgramIdProvider =
    NotifierProvider<SelectedProgramIdNotifier, String?>(
      SelectedProgramIdNotifier.new,
    );

/// A provider that exposes the selected program.
final selectedProgramProvider = Provider<WorkoutProgram?>((ref) {
  final programs = ref.watch(programsStreamProvider).asData?.value;
  final selectedId = ref.watch(selectedProgramIdProvider);
  if (programs == null || programs.isEmpty) {
    return null;
  }
  if (selectedId == null) {
    return programs.first;
  }
  return programs.firstWhereOrNull((program) => program.id == selectedId) ??
      programs.first;
});

/// A provider that exposes the selected week.
final selectedWeekProvider =
    NotifierProvider<SelectedWeekNotifier, int>(SelectedWeekNotifier.new);

/// A provider that exposes whether to show only the current week.
final showOnlyCurrentWeekProvider =
    NotifierProvider<ShowOnlyCurrentWeekNotifier, bool>(
      ShowOnlyCurrentWeekNotifier.new,
    );

/// A notifier for the selected program ID.
class SelectedProgramIdNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  /// Sets the selected program ID.
  void set(String? value) => state = value;
}

/// A notifier for the selected week.
class SelectedWeekNotifier extends Notifier<int> {
  @override
  int build() => 1;

  /// Sets the selected week.
  void set(int value) => state = value;
}

/// A notifier for whether to show only the current week.
class ShowOnlyCurrentWeekNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  /// Sets whether to show only the current week.
  void set(bool value) => state = value;

  /// Toggles whether to show only the current week.
  void toggle() => state = !state;
}
