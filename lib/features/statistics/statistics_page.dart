import 'package:file_picker/file_picker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:collection/collection.dart';

import '../../core/models/training_program.dart';
import '../../core/models/workout_session.dart';
import '../../core/providers/session_repository_provider.dart';
import '../../core/utils/file_loader.dart';
import '../../core/utils/file_saver.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/empty_state.dart';
import '../programs/providers/programs_providers.dart';
import '../session/providers/session_providers.dart';
import 'utils/session_statistics.dart';

/// The provider for the statistics program filter.
final statisticsProgramFilterProvider =
    NotifierProvider<StatisticsProgramFilterNotifier, String?>(
      StatisticsProgramFilterNotifier.new,
    );

/// A notifier for the statistics program filter.
class StatisticsProgramFilterNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  /// Sets the program filter.
  void set(String? value) => state = value;
}

/// The page that displays the statistics.
class StatisticsPage extends ConsumerStatefulWidget {
  /// Creates a new statistics page.
  const StatisticsPage({super.key});

  @override
  ConsumerState<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends ConsumerState<StatisticsPage> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;
  String? _selectedExerciseId;
  Set<String> _selectedCategories = <String>{};

  DateTime _dateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedDay = _dateOnly(now);
    _selectedDay = _focusedDay;
  }

  void _toggleCategory(String category, Set<String> available) {
    setState(() {
      if (_selectedCategories.isEmpty) {
        _selectedCategories = {category};
      } else if (_selectedCategories.contains(category)) {
        _selectedCategories = {
          ..._selectedCategories,
        }..remove(category);
      } else {
        _selectedCategories = {
          ..._selectedCategories,
          category,
        };
      }
      _selectedCategories = _selectedCategories
          .where((item) => available.contains(item))
          .toSet();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final sessionsAsync = ref.watch(sessionHistoryProvider);
    final programsAsync = ref.watch(programsStreamProvider);
    final filter = ref.watch(statisticsProgramFilterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.tabStatistics),
        actions: [
          IconButton(
            icon: const Icon(Icons.download_outlined),
            tooltip: l10n.exportData,
            onPressed: () => _exportSessions(context),
          ),
          IconButton(
            icon: const Icon(Icons.upload_outlined),
            tooltip: l10n.importData,
            onPressed: () => _importSessions(context),
          ),
        ],
      ),
      body: sessionsAsync.when(
        data: (sessions) {
          if (sessions.isEmpty) {
            return EmptyState(
              icon: Icons.auto_graph_outlined,
              title: l10n.statisticsEmpty,
            );
          }

          final programs = programsAsync.asData?.value ?? const [];
          final metrics = computeMetrics(sessions, programId: filter);
          final events = sessionsByDay(sessions, programId: filter);
          final exerciseSeries = metrics.exerciseTrends;
          final availableCategories =
              metrics.volumeByCategory.map((series) => series.category).toSet();

          if (_selectedCategories.isNotEmpty) {
            final cleaned = _selectedCategories
                .where((category) => availableCategories.contains(category))
                .toSet();
            if (cleaned.length != _selectedCategories.length) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                setState(() {
                  _selectedCategories = cleaned;
                });
              });
            }
          }
          if (exerciseSeries.isNotEmpty &&
              (_selectedExerciseId == null ||
                  !exerciseSeries.any(
                    (series) => series.exerciseId == _selectedExerciseId,
                  ))) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              setState(
                () => _selectedExerciseId = exerciseSeries.first.exerciseId,
              );
            });
          }
          final selectedSeries =
              exerciseSeries.firstWhereOrNull(
                (series) => series.exerciseId == _selectedExerciseId,
              ) ??
              (exerciseSeries.isNotEmpty ? exerciseSeries.first : null);
          final selectedSessions = _selectedDay == null
              ? const <WorkoutSession>[]
              : (events[_selectedDay!] ?? const <WorkoutSession>[]);

          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              _ProgramFilter(programs: programs),
              const SizedBox(height: 16),
              _OverviewSection(metrics: metrics),
              const SizedBox(height: 24),
              _CategoryVolumeChart(
                metrics: metrics,
                availableCategories: availableCategories,
                selectedCategories: _selectedCategories,
                onToggleCategory: (category) =>
                    _toggleCategory(category, availableCategories),
              ),
              const SizedBox(height: 24),
              _ExerciseProgressionChart(
                seriesList: exerciseSeries,
                selectedSeries: selectedSeries,
                onSeriesChanged: (series) {
                  setState(() => _selectedExerciseId = series.exerciseId);
                },
              ),
              const SizedBox(height: 24),
              _BestLiftList(metrics: metrics),
              const SizedBox(height: 24),
              _TrainingCalendar(
                focusedDay: _focusedDay,
                selectedDay: _selectedDay,
                events: events,
                onDaySelected: (selectedDay, focusedDay) {
                  final normalizedSelected = _dateOnly(selectedDay);
                  final normalizedFocused = _dateOnly(focusedDay);
                  setState(() {
                    _selectedDay = normalizedSelected;
                    _focusedDay = normalizedFocused;
                  });
                },
              ),
              const SizedBox(height: 12),
              _SessionListForDay(sessions: selectedSessions),
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
    );
  }

  Future<void> _exportSessions(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final repository = ref.read(sessionRepositoryProvider);
    final json = await repository.exportSessions();

    if (kIsWeb) {
      await Clipboard.setData(ClipboardData(text: json));
      if (!context.mounted) return;
      _showSnack(context, l10n.copiedToClipboard);
      return;
    }

    final path = await FilePicker.platform.saveFile(
      dialogTitle: l10n.exportData,
      fileName: 'fitmax_sessions.json',
      type: FileType.custom,
      allowedExtensions: const ['json'],
    );

    if (path == null) {
      await Clipboard.setData(ClipboardData(text: json));
      if (!context.mounted) return;
      _showSnack(context, l10n.copiedToClipboard);
      return;
    }

    try {
      await saveStringToFile(path, json);
      if (!context.mounted) return;
      _showSnack(context, '${l10n.exportData}: $path');
    } catch (_) {
      await Clipboard.setData(ClipboardData(text: json));
      if (!context.mounted) return;
      _showSnack(context, l10n.fileSaveUnsupported);
    }
  }

  Future<void> _importSessions(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final repository = ref.read(sessionRepositoryProvider);

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: const ['json'],
        withData: true,
      );
      if (result == null || result.files.isEmpty) {
        final clipboard = await Clipboard.getData('text/plain');
        final json = clipboard?.text;
        if (json == null || json.isEmpty) {
          if (!context.mounted) return;
          _showSnack(context, l10n.programImportError);
          return;
        }
        final count = await repository.importSessions(json);
        if (!context.mounted) return;
        _showSnack(context, l10n.importedSessionsMessage(count));
        return;
      }
      final file = result.files.single;
      final content = await loadPlatformFileContent(file);
      final imported = await repository.importSessions(content);
      if (!context.mounted) return;
      _showSnack(context, l10n.importedSessionsMessage(imported));
    } catch (_) {
      if (!context.mounted) return;
      _showSnack(context, l10n.programImportError);
    }
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _ProgramFilter extends ConsumerWidget {
  const _ProgramFilter({required this.programs});

  final List<WorkoutProgram> programs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final selected = ref.watch(statisticsProgramFilterProvider);

    return Row(
      children: [
        Text(l10n.filtersTitle, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(width: 16),
        DropdownButton<String?>(
          value: selected,
          onChanged: (value) =>
              ref.read(statisticsProgramFilterProvider.notifier).set(value),
          items: [
            DropdownMenuItem<String?>(
              value: null,
              child: Text(l10n.allProgramsOption),
            ),
            ...programs.map(
              (program) => DropdownMenuItem<String?>(
                value: program.id,
                child: Text(program.name),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _OverviewSection extends StatelessWidget {
  const _OverviewSection({required this.metrics});

  final SessionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _StatCard(
          title: l10n.totalSessionsLabel,
          value: metrics.totalSessions.toString(),
          icon: Icons.calendar_today,
        ),
        _StatCard(
          title: l10n.volumeLabel,
          value: metrics.totalVolume.toStringAsFixed(0),
          icon: Icons.fitness_center,
        ),
        _StatCard(
          title: l10n.averageLabel,
          value: metrics.averageVolume.toStringAsFixed(0),
          icon: Icons.trending_up,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 32),
              const SizedBox(height: 12),
              Text(
                value,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryVolumeChart extends StatelessWidget {
  const _CategoryVolumeChart({
    required this.metrics,
    required this.availableCategories,
    required this.selectedCategories,
    required this.onToggleCategory,
  });

  final SessionMetrics metrics;
  final Set<String> availableCategories;
  final Set<String> selectedCategories;
  final ValueChanged<String> onToggleCategory;

  Set<String> get _activeCategories =>
      selectedCategories.isEmpty ? availableCategories : selectedCategories;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (metrics.volumeByCategory.isEmpty) {
      return EmptyState(icon: Icons.show_chart, title: l10n.statisticsEmpty);
    }

    final seriesList = metrics.volumeByCategory.toList();
    final filteredEntries = seriesList
        .asMap()
        .entries
        .where((entry) => _activeCategories.contains(entry.value.category))
        .toList();

    final allPoints = filteredEntries
        .expand((entry) => entry.value.points)
        .toList();
    if (allPoints.isEmpty) {
      return EmptyState(icon: Icons.show_chart, title: l10n.statisticsEmpty);
    }

    final startDate = allPoints
        .map((point) => point.date)
        .reduce((a, b) => a.isBefore(b) ? a : b);

    final lines = filteredEntries
        .map((entry) {
          final index = entry.key;
          final series = entry.value;
          final spots = series.points
              .map(
                (point) => FlSpot(
                  point.date.difference(startDate).inDays.toDouble(),
                  point.volume,
                ),
              )
              .toList();
          if (spots.isEmpty) {
            return null;
          }
          final showDots = spots.length <= 2;
          final seriesColor = _seriesColor(index, Theme.of(context).colorScheme);
          return LineChartBarData(
            spots: spots,
            isCurved: true,
            color: seriesColor,
            barWidth: 3,
            dotData: FlDotData(
              show: showDots,
              getDotPainter:
                  (spot, xPercentage, barData, indexInBar) => FlDotCirclePainter(
                    radius: 4,
                    color: seriesColor,
                    strokeColor: Theme.of(context).colorScheme.onSurface,
                    strokeWidth: 1.5,
                  ),
            ),
          );
        })
        .whereType<LineChartBarData>()
        .toList();

    if (lines.isEmpty) {
      return EmptyState(icon: Icons.show_chart, title: l10n.statisticsEmpty);
    }

    final maxVolume = lines
        .expand((line) => line.spots)
        .map((spot) => spot.y)
        .fold<double>(
          0,
          (previous, value) => value > previous ? value : previous,
        );

    return Card(
      child: SizedBox(
        height: 320,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.categoryVolumeTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l10n.volumeLegend,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 8,
                children: seriesList
                    .asMap()
                    .entries
                    .map(
                      (entry) {
                        final category = entry.value.category;
                        final color =
                            _seriesColor(entry.key, Theme.of(context).colorScheme);
                        final isSelected = _activeCategories.contains(category);
                        return _LegendChip(
                          color: color,
                          label: category,
                          selected: isSelected,
                          onSelected: (_) => onToggleCategory(category),
                        );
                      },
                    )
                    .toList(),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: LineChart(
                  LineChartData(
                    lineBarsData: lines,
                    minY: 0,
                    maxY: maxVolume == 0 ? 1 : maxVolume * 1.2,
                    gridData: FlGridData(show: true, drawVerticalLine: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval:
                              (lines.expand((line) => line.spots).length / 4)
                                  .clamp(1, double.infinity),
                          getTitlesWidget: (value, meta) {
                            final date = startDate.add(
                              Duration(days: value.toInt()),
                            );
                            final label = DateFormat.Md().format(date);
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                label,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          interval: maxVolume == 0 ? 1 : maxVolume / 4,
                          getTitlesWidget: (value, meta) =>
                              Text(value.toStringAsFixed(0)),
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _seriesColor(int index, ColorScheme scheme) {
    final palette = [
      scheme.primary,
      scheme.secondary,
      scheme.tertiary,
      scheme.error,
      scheme.primaryContainer,
      scheme.secondaryContainer,
      scheme.tertiaryContainer,
    ];
    return palette[index % palette.length];
  }
}

class _ExerciseProgressionChart extends StatelessWidget {
  const _ExerciseProgressionChart({
    required this.seriesList,
    required this.selectedSeries,
    required this.onSeriesChanged,
  });

  final List<ExerciseTrendSeries> seriesList;
  final ExerciseTrendSeries? selectedSeries;
  final ValueChanged<ExerciseTrendSeries> onSeriesChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (seriesList.isEmpty || selectedSeries == null) {
      return EmptyState(
        icon: Icons.show_chart_outlined,
        title: l10n.noExerciseData,
      );
    }

    final startDate = selectedSeries!.points.first.date;
    final spots = selectedSeries!.points
        .map(
          (point) => FlSpot(
            point.date.difference(startDate).inDays.toDouble(),
            point.volume,
          ),
        )
        .toList();

    final maxWeight = spots.fold<double>(
      0,
      (prev, spot) => spot.y > prev ? spot.y : prev,
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.exerciseProgressionTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.fitness_center_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<ExerciseTrendSeries>(
                    value: selectedSeries,
                    isExpanded: true,
                    onChanged: (value) {
                      if (value != null) {
                        onSeriesChanged(value);
                      }
                    },
                    items: seriesList
                        .map(
                          (series) => DropdownMenuItem(
                            value: series,
                            child: Text(series.exerciseName),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l10n.exerciseProgressionLegend,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: Theme.of(context).colorScheme.primary,
                      barWidth: 3,
                      dotData: const FlDotData(show: true),
                    ),
                  ],
                  minY: 0,
                  maxY: maxWeight == 0 ? 1 : maxWeight * 1.1,
                  gridData: FlGridData(show: true, drawVerticalLine: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: (spots.length / 4).clamp(1, double.infinity),
                        getTitlesWidget: (value, meta) {
                          final date = startDate.add(
                            Duration(days: value.toInt()),
                          );
                          final label = DateFormat.Md().format(date);
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              label,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: maxWeight == 0 ? 1 : maxWeight / 4,
                        getTitlesWidget: (value, meta) =>
                            Text(value.toStringAsFixed(1)),
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LegendChip extends StatelessWidget {
  const _LegendChip({
    required this.color,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final Color color;
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      avatar: CircleAvatar(radius: 6, backgroundColor: color),
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
      selectedColor: color.withValues(alpha: 0.18),
      showCheckmark: false,
    );
  }
}

class _BestLiftList extends StatelessWidget {
  const _BestLiftList({required this.metrics});

  final SessionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (metrics.bestLiftByExercise.isEmpty) {
      return const SizedBox.shrink();
    }

    final entries = metrics.bestLiftByExercise.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.bestLiftLabel,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l10n.bestLiftLegend,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            for (final entry in entries.take(6))
              ListTile(
                leading: const Icon(Icons.star_outline),
                title: Text(entry.key),
                trailing: Text(
                  '${entry.value.toStringAsFixed(1)} ${l10n.weightShort}',
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _TrainingCalendar extends StatelessWidget {
  const _TrainingCalendar({
    required this.focusedDay,
    required this.selectedDay,
    required this.events,
    required this.onDaySelected,
  });

  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Map<DateTime, List<WorkoutSession>> events;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TableCalendar<WorkoutSession>(
          focusedDay: focusedDay,
          firstDay: DateTime.utc(2021, 1, 1),
          lastDay: DateTime.utc(2100, 12, 31),
          selectedDayPredicate: (day) => isSameDay(selectedDay, day),
          onDaySelected: onDaySelected,
          eventLoader: (day) =>
              events[DateTime(day.year, day.month, day.day)] ?? const [],
          calendarStyle: CalendarStyle(
            markerDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class _SessionListForDay extends StatelessWidget {
  const _SessionListForDay({required this.sessions});

  final List<WorkoutSession> sessions;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (sessions.isEmpty) {
      return Text(l10n.noSessionsForDay);
    }
    final dateFormat = DateFormat.Hm();
    return Card(
      child: Column(
        children: sessions
            .map(
              (session) => ListTile(
                leading: const Icon(Icons.fitness_center_outlined),
                title: Text(
                  '${session.programName} · ${l10n.weekLabel(session.week)}',
                ),
                subtitle: Text(dateFormat.format(session.startedAt)),
              ),
            )
            .toList(),
      ),
    );
  }
}
