import 'package:freezed_annotation/freezed_annotation.dart';

import '../serialization/duration_converter.dart';

part 'workout_session.freezed.dart';
part 'workout_session.g.dart';

/// Represents a workout session.
@freezed
class WorkoutSession with _$WorkoutSession {
  /// Creates a new workout session.
  const factory WorkoutSession({
    /// The unique identifier of the session.
    required String id,
    /// The unique identifier of the program this session belongs to.
    required String programId,
    /// The name of the program this session belongs to.
    required String programName,
    /// The week number of the program this session belongs to.
    required int week,
    /// The date and time the session was started.
    required DateTime startedAt,
    /// The date and time the session was completed.
    DateTime? completedAt,
    /// The list of exercises in the session.
    required List<ExerciseSession> exercises,
    /// Optional notes for the session.
    String? notes,
  }) = _WorkoutSession;

  /// Creates a new workout session from a JSON object.
  factory WorkoutSession.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionFromJson(json);
}

/// Represents an exercise in a workout session.
@freezed
class ExerciseSession with _$ExerciseSession {
  /// Creates a new exercise session.
  const factory ExerciseSession({
    /// The unique identifier of the exercise.
    required String exerciseId,
    /// The name of the exercise.
    required String exerciseName,
    /// The list of sets for the exercise.
    @Default([]) List<SetLog> sets,
    /// The target rest time in seconds between sets.
    int? restSecondsTarget,
    /// The time under tension for the exercise.
    String? tut,
    /// The buffer for the exercise.
    int? buf,
    /// The intensity of the exercise.
    String? intensity,
    /// The URL of a video demonstrating the exercise.
    String? videoUrl,
    /// The target number of reps for the exercise.
    String? repsTarget,
    /// An optional note for the exercise.
    String? note,
    /// The category of the exercise.
    String? category,
  }) = _ExerciseSession;

  /// Creates a new exercise session from a JSON object.
  factory ExerciseSession.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSessionFromJson(json);
}

/// Represents a set in an exercise.
@freezed
class SetLog with _$SetLog {
  /// Creates a new set log.
  const factory SetLog({
    /// The index of the set.
    required int index,
    /// The weight used for the set.
    double? weight,
    /// The number of reps performed in the set.
    int? reps,
    /// The rest time after the set.
    @DurationSecondsConverter() Duration? rest,
    /// An optional note for the set.
    String? note,
  }) = _SetLog;

  /// Creates a new set log from a JSON object.
  factory SetLog.fromJson(Map<String, dynamic> json) => _$SetLogFromJson(json);
}
