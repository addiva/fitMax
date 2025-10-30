import '../../../core/models/workout_session.dart';

class SessionMetrics {
  SessionMetrics({
    required this.totalSessions,
    required this.totalVolume,
    required this.volumePoints,
    required this.bestLiftByExercise,
    required this.volumeByCategory,
    required this.exerciseTrends,
  });

  final int totalSessions;
  final double totalVolume;
  final List<VolumePoint> volumePoints;
  final Map<String, double> bestLiftByExercise;
  final List<CategoryVolumeSeries> volumeByCategory;
  final List<ExerciseTrendSeries> exerciseTrends;

  double get averageVolume =>
      totalSessions == 0 ? 0 : totalVolume / totalSessions;
}

class VolumePoint {
  VolumePoint(this.date, this.volume);

  final DateTime date;
  final double volume;
}

class CategoryVolumeSeries {
  CategoryVolumeSeries({required this.category, required this.points});

  final String category;
  final List<VolumePoint> points;
}

class ExerciseTrendSeries {
  ExerciseTrendSeries({
    required this.exerciseId,
    required this.exerciseName,
    required this.points,
  });

  final String exerciseId;
  final String exerciseName;
  final List<VolumePoint> points;
}

SessionMetrics computeMetrics(
  List<WorkoutSession> sessions, {
  String? programId,
}) {
  final filtered = programId == null
      ? sessions
      : sessions.where((session) => session.programId == programId).toList();

  double totalVolume = 0;
  final bestLift = <String, double>{};
  final volumePoints = <VolumePoint>[];
  final categoryTotals = <String, Map<DateTime, double>>{};
  final exerciseSeries = <String, ExerciseTrendSeriesBuilder>{};

  for (final session in filtered) {
    final sessionDate = DateTime(
      session.startedAt.year,
      session.startedAt.month,
      session.startedAt.day,
    );
    final sessionVolume = _sessionVolume(session);
    totalVolume += sessionVolume;
    volumePoints.add(VolumePoint(session.startedAt, sessionVolume));

    final categoryForSession = <String, double>{};

    for (final exercise in session.exercises) {
      double? bestSet;
      double exerciseVolume = 0;
      for (final set in exercise.sets) {
        final weight = set.weight ?? 0;
        if (bestSet == null || weight > bestSet) {
          bestSet = weight;
        }
        final reps = set.reps ?? 0;
        exerciseVolume += weight * reps;
      }
      final candidate = bestSet ?? 0;
      if (candidate <= 0) continue;
      bestLift.update(
        exercise.exerciseName,
        (value) => value > candidate ? value : candidate,
        ifAbsent: () => candidate,
      );

      final category = (exercise.category?.isNotEmpty ?? false)
          ? exercise.category!
          : 'Altro';
      categoryForSession.update(
        category,
        (value) => value + exerciseVolume,
        ifAbsent: () => exerciseVolume,
      );

      final series = exerciseSeries.putIfAbsent(
        exercise.exerciseId,
        () => ExerciseTrendSeriesBuilder(exercise.exerciseId, exercise.exerciseName),
      );
      if (candidate > 0) {
        series.addPoint(sessionDate, candidate);
      }
    }

    categoryForSession.forEach((category, volume) {
      final map = categoryTotals.putIfAbsent(category, () => <DateTime, double>{});
      map.update(sessionDate, (value) => value + volume, ifAbsent: () => volume);
    });
  }

  volumePoints.sort((a, b) => a.date.compareTo(b.date));

  final volumeByCategory = categoryTotals.entries.map((entry) {
    final points = entry.value.entries
        .map((item) => VolumePoint(item.key, item.value))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
    return CategoryVolumeSeries(category: entry.key, points: points);
  }).toList()
    ..sort((a, b) => a.category.toLowerCase().compareTo(b.category.toLowerCase()));

  final exerciseTrends = exerciseSeries.values
      .map((builder) => builder.build())
      .where((series) => series.points.length > 1)
      .toList()
    ..sort((a, b) => a.exerciseName.toLowerCase().compareTo(b.exerciseName.toLowerCase()));

  return SessionMetrics(
    totalSessions: filtered.length,
    totalVolume: totalVolume,
    volumePoints: volumePoints,
    bestLiftByExercise: bestLift,
    volumeByCategory: volumeByCategory,
    exerciseTrends: exerciseTrends,
  );
}

double _sessionVolume(WorkoutSession session) {
  double volume = 0;
  for (final exercise in session.exercises) {
    for (final set in exercise.sets) {
      final weight = set.weight ?? 0;
      final reps = set.reps ?? 0;
      volume += weight * reps;
    }
  }
  return volume;
}

Map<DateTime, List<WorkoutSession>> sessionsByDay(
  List<WorkoutSession> sessions, {
  String? programId,
}) {
  final map = <DateTime, List<WorkoutSession>>{};
  for (final session in sessions) {
    if (programId != null && session.programId != programId) continue;
    final day = DateTime(
      session.startedAt.year,
      session.startedAt.month,
      session.startedAt.day,
    );
    map.putIfAbsent(day, () => []).add(session);
  }
  return map;
}

class ExerciseTrendSeriesBuilder {
  ExerciseTrendSeriesBuilder(this.id, this.name);

  final String id;
  final String name;
  final Map<DateTime, double> _points = {};

  void addPoint(DateTime date, double weight) {
    _points[date] = weight;
  }

  ExerciseTrendSeries build() {
    final points = _points.entries
        .map((entry) => VolumePoint(entry.key, entry.value))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
    return ExerciseTrendSeries(
      exerciseId: id,
      exerciseName: name,
      points: points,
    );
  }
}
