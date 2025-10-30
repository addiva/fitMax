import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/router/app_router.dart';
import '../../core/models/training_program.dart';
import '../../core/models/workout_session.dart';
import '../../core/providers/session_repository_provider.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/empty_state.dart';
import '../programs/providers/programs_providers.dart';
import 'providers/active_session_controller.dart';
import 'providers/session_providers.dart';

/// The page that displays the session information.
class SessionPage extends ConsumerWidget {
  /// Creates a new session page.
  const SessionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final programsAsync = ref.watch(programsStreamProvider);
    final activeSession = ref.watch(activeSessionProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.tabSession),
        actions: [
          if (activeSession != null)
            TextButton.icon(
              onPressed: () => _navigateToSession(context),
              icon: const Icon(Icons.play_circle_outline),
              label: Text(l10n.sessionResume),
            ),
        ],
      ),
      body: SafeArea(
        child: programsAsync.when(
          data: (programs) {
            final suggested = ref.watch(suggestedSessionProvider);
            final selectedProgram =
                ref.watch(selectedProgramProvider) ?? programs.first;
            final selectedWeek = ref
                .watch(selectedWeekProvider)
                .clamp(1, selectedProgram.weeks.total);

            final bottomPadding = MediaQuery.of(context).padding.bottom + 24;
            return ListView(
              padding: EdgeInsets.fromLTRB(24, 24, 24, bottomPadding),
              children: [
                if (suggested != null)
                  _SuggestedSessionCard(
                    suggestion: suggested,
                    onStart: () => _startSession(
                      context,
                      ref,
                      suggested.program,
                      suggested.week,
                    ),
                  ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.filtersTitle,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            DropdownButton<WorkoutProgram>(
                              value: selectedProgram,
                              onChanged: (value) {
                                if (value == null) return;
                                ref
                                    .read(selectedProgramIdProvider.notifier)
                                    .set(value.id);
                                ref
                                    .read(selectedWeekProvider.notifier)
                                    .set(1);
                              },
                              items: programs
                                  .map(
                                    (program) => DropdownMenuItem(
                                      value: program,
                                      child: Text(program.name),
                                    ),
                                  )
                                  .toList(),
                            ),
                            DropdownButton<int>(
                              value: selectedWeek,
                              onChanged: (value) {
                                if (value != null) {
                                  ref
                                      .read(selectedWeekProvider.notifier)
                                      .set(value);
                                }
                              },
                              items: List.generate(
                                selectedProgram.weeks.total,
                                (index) => DropdownMenuItem(
                                  value: index + 1,
                                  child: Text(
                                    selectedProgram.weeks.deload == index + 1
                                        ? '${l10n.weekLabel(index + 1)} · ${l10n.deloadWeekLabel}'
                                        : l10n.weekLabel(index + 1),
                                  ),
                                ),
                              ),
                            ),
                            FilledButton.icon(
                              onPressed: () => _startSession(
                                context,
                                ref,
                                selectedProgram,
                                selectedWeek,
                              ),
                              icon: const Icon(Icons.play_arrow),
                              label: Text(
                                activeSession == null
                                    ? l10n.sessionStart
                                    : l10n.sessionResume,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _ProgramPreview(program: selectedProgram, week: selectedWeek),
                const SizedBox(height: 24),
                _SessionHistory(),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(error.toString()),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _startSession(
    BuildContext context,
    WidgetRef ref,
    WorkoutProgram program,
    int week,
  ) async {
    final controller = ref.read(activeSessionProvider.notifier);
    await controller.startSession(program: program, week: week);
    ref.read(selectedProgramIdProvider.notifier).set(program.id);
    ref.read(selectedWeekProvider.notifier).set(week);
    if (!context.mounted) return;
    _navigateToSession(context);
  }

  void _navigateToSession(BuildContext context) {
    context.pushNamed(AppRoute.sessionStart.name);
  }
}

class _SuggestedSessionCard extends ConsumerWidget {
  const _SuggestedSessionCard({
    required this.suggestion,
    required this.onStart,
  });

  final SessionSuggestion suggestion;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final deloadWeek = suggestion.program.weeks.deload;
    final weekLabel = deloadWeek == suggestion.week
        ? '${l10n.weekLabel(suggestion.week)} · ${l10n.deloadWeekLabel}'
        : l10n.weekLabel(suggestion.week);
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.suggestedSessionTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '${suggestion.program.name} · $weekLabel',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.suggestedSessionReason,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            if (suggestion.lastSession != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  l10n.lastSessionLabel(
                    MaterialLocalizations.of(
                      context,
                    ).formatShortDate(suggestion.lastSession!.startedAt),
                  ),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.bottomRight,
              child: FilledButton.icon(
                onPressed: onStart,
                icon: const Icon(Icons.play_arrow),
                label: Text(l10n.sessionStart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgramPreview extends StatelessWidget {
  const _ProgramPreview({required this.program, required this.week});

  final WorkoutProgram program;
  final int week;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final exercises = program.exercises;
    final deloadWeek = program.weeks.deload;
    final weekLabel = deloadWeek == week
        ? '${l10n.weekLabel(week)} · ${l10n.deloadWeekLabel}'
        : l10n.weekLabel(week);
    if (exercises.isEmpty) {
      return EmptyState(
        icon: Icons.fitness_center_outlined,
        title: l10n.programsEmptyTitle,
        subtitle: l10n.programsEmptySubtitle,
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${program.name} · $weekLabel',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            for (final exercise in exercises)
              _ExercisePreview(exercise: exercise, week: week),
          ],
        ),
      ),
    );
  }
}

class _ExercisePreview extends StatelessWidget {
  const _ExercisePreview({required this.exercise, required this.week});

  final WorkoutExercise exercise;
  final int week;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final plan = exercise.weeks.firstWhere(
      (item) => item.week == week,
      orElse: () =>
          exercise.weeks.isEmpty ? _fallbackPlan() : exercise.weeks.first,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(exercise.name, style: Theme.of(context).textTheme.titleMedium),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _InfoChip(label: l10n.setsShort, value: plan.sets.toString()),
              _InfoChip(label: l10n.repsShort, value: plan.reps),
              _InfoChip(
                label: l10n.restShort,
                value: _formatRest(plan.restSeconds),
              ),
              if (plan.tut != null)
                _InfoChip(label: l10n.tutShort, value: plan.tut!),
              if (plan.buf != null)
                _InfoChip(label: l10n.bufShort, value: '${plan.buf}'),
            ],
          ),
        ],
      ),
    );
  }

  ExerciseWeekPlan _fallbackPlan() {
    return ExerciseWeekPlan(week: week, sets: 3, reps: '10', restSeconds: 90);
  }

  String _formatRest(int seconds) {
    final minutes = seconds ~/ 60;
    final remainder = seconds % 60;
    if (minutes == 0) {
      return '${remainder}s';
    }
    if (remainder == 0) {
      return '${minutes}m';
    }
    return '${minutes}m ${remainder}s';
  }
}

class _SessionHistory extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final history = ref.watch(sessionHistoryProvider);

    return history.when(
      data: (sessions) {
        if (sessions.isEmpty) {
          return EmptyState(
            icon: Icons.history_toggle_off,
            title: l10n.noSessionsYet,
          );
        }
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  l10n.tabStatistics,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sessions.length.clamp(0, 10),
                separatorBuilder: (context, _) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final session = sessions[index];
                  final date = MaterialLocalizations.of(
                    context,
                  ).formatShortDate(session.startedAt);
                  return ListTile(
                    title: Text(
                      '${session.programName} · ${l10n.weekLabel(session.week)}',
                    ),
                    subtitle: Text(date),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      tooltip: l10n.deleteSession,
                      onPressed: () =>
                          _confirmDeleteSession(context, ref, session),
                    ),
                    onTap: () => _showSessionDetail(context, session),
                  );
                },
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Padding(
        padding: const EdgeInsets.all(24),
        child: Text(error.toString()),
      ),
    );
  }
}

Future<void> _confirmDeleteSession(
  BuildContext context,
  WidgetRef ref,
  WorkoutSession session,
) async {
  final l10n = AppLocalizations.of(context);
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.sessionDeleteTitle),
      content: Text(l10n.sessionDeleteMessage),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(l10n.actionCancel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(l10n.deleteSession),
        ),
      ],
    ),
  );

  if (confirmed == true) {
    await ref.read(sessionRepositoryProvider).deleteSession(session.id);
  }
}

void _showSessionDetail(BuildContext context, WorkoutSession session) {
  final l10n = AppLocalizations.of(context);
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      builder: (context, controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.sessionDetailTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '${session.programName} · ${l10n.weekLabel(session.week)}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: session.exercises.length,
                itemBuilder: (context, index) {
                  final exercise = session.exercises[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exercise.exerciseName,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          if (exercise.category?.isNotEmpty == true)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                exercise.category!,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          const SizedBox(height: 12),
                          ...exercise.sets.map(
                            (set) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('#${set.index}'),
                                  Text(
                                    '${set.reps ?? '-'} ${l10n.repsShort} · '
                                    '${set.weight != null ? set.weight!.toStringAsFixed(1) : '-'} ${l10n.weightShort}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(l10n.sessionDetailClose),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 200),
      child: Chip(
        label: Text(
          '$label: $value',
          style: theme.textTheme.bodySmall,
          softWrap: true,
        ),
      ),
    );
  }
}
