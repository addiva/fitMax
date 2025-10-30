import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/training_program.dart';
import '../../../core/providers/program_repository_provider.dart';

final programsBootstrapProvider = FutureProvider<void>((ref) async {
  final repo = ref.watch(programRepositoryProvider);
  await repo.ensureInitialProgramsImported();
});

final programsStreamProvider = StreamProvider<List<WorkoutProgram>>((ref) {
  final repo = ref.watch(programRepositoryProvider);
  return repo.watchPrograms();
});

final selectedProgramIdProvider =
    NotifierProvider<SelectedProgramIdNotifier, String?>(
      SelectedProgramIdNotifier.new,
    );

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

final selectedWeekProvider =
    NotifierProvider<SelectedWeekNotifier, int>(SelectedWeekNotifier.new);
final showOnlyCurrentWeekProvider =
    NotifierProvider<ShowOnlyCurrentWeekNotifier, bool>(
      ShowOnlyCurrentWeekNotifier.new,
    );

class SelectedProgramIdNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void set(String? value) => state = value;
}

class SelectedWeekNotifier extends Notifier<int> {
  @override
  int build() => 1;

  void set(int value) => state = value;
}

class ShowOnlyCurrentWeekNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  void set(bool value) => state = value;

  void toggle() => state = !state;
}
