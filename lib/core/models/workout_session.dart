import 'package:freezed_annotation/freezed_annotation.dart';

import '../serialization/duration_converter.dart';

part 'workout_session.freezed.dart';
part 'workout_session.g.dart';

@freezed
class WorkoutSession with _$WorkoutSession {
  const factory WorkoutSession({
    required String id,
    required String programId,
    required String programName,
    required int week,
    required DateTime startedAt,
    DateTime? completedAt,
    required List<ExerciseSession> exercises,
    String? notes,
  }) = _WorkoutSession;

  factory WorkoutSession.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionFromJson(json);
}

@freezed
class ExerciseSession with _$ExerciseSession {
  const factory ExerciseSession({
    required String exerciseId,
    required String exerciseName,
    @Default([]) List<SetLog> sets,
    int? restSecondsTarget,
    String? tut,
    int? buf,
    String? intensity,
    String? videoUrl,
    String? repsTarget,
    String? note,
    String? category,
  }) = _ExerciseSession;

  factory ExerciseSession.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSessionFromJson(json);
}

@freezed
class SetLog with _$SetLog {
  const factory SetLog({
    required int index,
    double? weight,
    int? reps,
    @DurationSecondsConverter() Duration? rest,
    String? note,
  }) = _SetLog;

  factory SetLog.fromJson(Map<String, dynamic> json) => _$SetLogFromJson(json);
}
