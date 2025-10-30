import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../core/models/workout_session.dart';
import '../../l10n/app_localizations.dart';
import 'providers/active_session_controller.dart';
import 'providers/active_session_state.dart';

/// The page for starting a workout session.
class StartSessionPage extends ConsumerStatefulWidget {
  /// Creates a new start session page.
  const StartSessionPage({super.key});

  @override
  ConsumerState<StartSessionPage> createState() => _StartSessionPageState();
}

class _StartSessionPageState extends ConsumerState<StartSessionPage> {
  final Map<String, TextEditingController> _repsControllers = {};
  final Map<String, TextEditingController> _weightControllers = {};

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
  }

  @override
  void dispose() {
    for (final controller in _repsControllers.values) {
      controller.dispose();
    }
    for (final controller in _weightControllers.values) {
      controller.dispose();
    }
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(activeSessionProvider);
    final l10n = AppLocalizations.of(context);

    if (state == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.sessionStart)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(l10n.programsEmptySubtitle),
          ),
        ),
      );
    }

    _syncControllers(state);
    final session = state.session;
    final exercise = state.currentExercise;
    final exerciseIndex = state.exerciseIndex;
    final totalExercises = session.exercises.length;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exercise.exerciseName),
            Text(
              '${session.programName} · ${l10n.weekLabel(session.week)}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Center(child: Text('${exerciseIndex + 1}/$totalExercises')),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _ExerciseSummary(exercise: exercise),
          const SizedBox(height: 16),
          _SetsList(
            exercise: exercise,
            exerciseIndex: exerciseIndex,
            repsControllers: _repsControllers,
            weightControllers: _weightControllers,
          ),
          const SizedBox(height: 16),
          _RestTimer(state: state),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: exerciseIndex > 0
                    ? () => ref
                          .read(activeSessionProvider.notifier)
                          .previousExercise()
                    : null,
                child: Text(
                  MaterialLocalizations.of(context).backButtonTooltip,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton(
                onPressed: exerciseIndex < totalExercises - 1
                    ? () => ref
                          .read(activeSessionProvider.notifier)
                          .nextExercise()
                    : () => _finishSession(context),
                child: Text(
                  exerciseIndex < totalExercises - 1
                      ? MaterialLocalizations.of(context).nextPageTooltip
                      : l10n.sessionEnd,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _finishSession(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.sessionEnd),
        content: Text(l10n.sessionFinishConfirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
    if (!context.mounted || confirm != true) return;
    await ref.read(activeSessionProvider.notifier).finishSession();
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  void _syncControllers(ActiveSessionState state) {
    final exercise = state.currentExercise;
    for (final set in exercise.sets) {
      final key = '${state.exerciseIndex}-${set.index}';
      _repsControllers.putIfAbsent(
        key,
        () => TextEditingController(text: set.reps?.toString() ?? ''),
      );
      _weightControllers.putIfAbsent(
        key,
        () => TextEditingController(text: set.weight?.toString() ?? ''),
      );
    }
  }
}

class _ExerciseSummary extends StatelessWidget {
  const _ExerciseSummary({required this.exercise});

  final ExerciseSession exercise;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            if (exercise.repsTarget != null)
              Chip(label: Text('${l10n.repsShort}: ${exercise.repsTarget}')),
            if (exercise.tut != null)
              Chip(label: Text('${l10n.tutShort}: ${exercise.tut}')),
            if (exercise.buf != null)
              Chip(label: Text('${l10n.bufShort}: ${exercise.buf}')),
            if (exercise.intensity != null)
              Chip(
                label: Text('${l10n.intensityShort}: ${exercise.intensity}'),
              ),
            if (exercise.note != null && exercise.note!.isNotEmpty)
              Text(exercise.note!, style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _SetsList extends ConsumerWidget {
  const _SetsList({
    required this.exercise,
    required this.exerciseIndex,
    required this.repsControllers,
    required this.weightControllers,
  });

  final ExerciseSession exercise;
  final int exerciseIndex;
  final Map<String, TextEditingController> repsControllers;
  final Map<String, TextEditingController> weightControllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Card(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: exercise.sets.length,
        separatorBuilder: (context, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final set = exercise.sets[index];
          final key = '$exerciseIndex-${set.index}';
          final repsController = repsControllers[key]!;
          final weightController = weightControllers[key]!;
          final targetReps = exercise.repsTarget ?? '-';
          return ListTile(
            title: Text('${l10n.repsShort}: $targetReps'),
            leading: CircleAvatar(child: Text(set.index.toString())),
            subtitle: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: repsController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(labelText: l10n.repsShort),
                    onChanged: (value) {
                      final reps = int.tryParse(value);
                      ref
                          .read(activeSessionProvider.notifier)
                          .updateSet(
                            exerciseIndex: exerciseIndex,
                            setIndex: index,
                            reps: reps,
                          );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: weightController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(labelText: l10n.weightShort),
                    onChanged: (value) {
                      final cleaned = value.replaceAll(',', '.');
                      final weight = double.tryParse(cleaned);
                      ref
                          .read(activeSessionProvider.notifier)
                          .updateSet(
                            exerciseIndex: exerciseIndex,
                            setIndex: index,
                            weight: weight,
                          );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _RestTimer extends ConsumerWidget {
  const _RestTimer({required this.state});

  final ActiveSessionState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final controller = ref.read(activeSessionProvider.notifier);
    final targetSeconds = state.currentExercise.restSecondsTarget ?? 60;
    final remaining = state.restSecondsRemaining ?? targetSeconds;
    final isResting = state.isResting;
    final isPaused = state.isRestPaused;

    late final String actionLabel;
    VoidCallback? action;
    if (!isResting) {
      actionLabel = l10n.sessionRestStart;
      action = () => controller.startRest();
    } else if (isPaused) {
      actionLabel = l10n.sessionRestResume;
      action = controller.resumeRest;
    } else {
      actionLabel = l10n.sessionRestPause;
      action = controller.pauseRest;
    }
    final minutes = remaining ~/ 60;
    final seconds = remaining % 60;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.sessionRest,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              children: [
                FilledButton(onPressed: action, child: Text(actionLabel)),
                OutlinedButton(
                  onPressed: isResting || state.restSecondsRemaining != null
                      ? controller.stopRest
                      : null,
                  child: Text(l10n.sessionRestReset),
                ),
              ],
            ),
            if (isPaused)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  l10n.sessionRestPaused,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
