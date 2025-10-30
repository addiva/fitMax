import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_program.freezed.dart';
part 'training_program.g.dart';

/// Represents a workout program.
@freezed
class WorkoutProgram with _$WorkoutProgram {
  /// Creates a new workout program.
  const factory WorkoutProgram({
    /// The unique identifier of the program.
    required String id,
    /// The name of the program.
    required String name,
    /// An optional note for the program.
    String? note,
    /// The configuration for the weeks in the program.
    @Default(WeeksConfig(total: 4)) WeeksConfig weeks,
    /// The list of exercises in the program.
    @Default([]) List<WorkoutExercise> exercises,
    /// The date and time the program was created.
    DateTime? createdAt,
    /// The date and time the program was last updated.
    DateTime? updatedAt,
    /// A list of tags for the program.
    @Default([]) List<String> tags,
  }) = _WorkoutProgram;

  /// Creates a new workout program from a JSON object.
  factory WorkoutProgram.fromJson(Map<String, dynamic> json) =>
      _$WorkoutProgramFromJson(json);
}

/// Represents the configuration for the weeks in a workout program.
@freezed
class WeeksConfig with _$WeeksConfig {
  /// Creates a new weeks configuration.
  const factory WeeksConfig({
    /// The total number of weeks in the program.
    required int total,
    /// The week in which to take a deload.
    int? deload,
  }) = _WeeksConfig;

  /// Creates a new weeks configuration from a JSON object.
  factory WeeksConfig.fromJson(Map<String, dynamic> json) =>
      _$WeeksConfigFromJson(json);
}

/// Represents an exercise in a workout program.
@freezed
class WorkoutExercise with _$WorkoutExercise {
  /// Creates a new workout exercise.
  const factory WorkoutExercise({
    /// The unique identifier of the exercise.
    required String id,
    /// The name of the exercise.
    required String name,
    /// The category of the exercise.
    String? category,
    /// An optional note for the exercise.
    String? note,
    /// The URL of a video demonstrating the exercise.
    String? videoUrl,
    /// The progression steps for the exercise.
    @Default([]) List<ExerciseProgressionStep> progression,
    /// The weekly plan for the exercise.
    @Default([]) List<ExerciseWeekPlan> weeks,
  }) = _WorkoutExercise;

  /// Creates a new workout exercise from a JSON object.
  factory WorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$WorkoutExerciseFromJson(json);
}

/// Represents a progression step for an exercise.
@freezed
class ExerciseProgressionStep with _$ExerciseProgressionStep {
  /// Creates a new exercise progression step.
  const factory ExerciseProgressionStep({
    /// The week to inherit the progression from.
    int? inherit,
    /// The offset of the week to inherit from.
    int? weekOffset,
    /// The number of sets to perform.
    int? sets,
    /// The number of reps to perform.
    String? reps,
    /// The rest time in seconds between sets.
    int? restSeconds,
    /// The time under tension for the exercise.
    String? tut,
    /// The buffer for the exercise.
    int? buf,
    /// The intensity of the exercise.
    String? intensity,
    /// An optional note for the progression step.
    String? note,
    /// The delta for the number of sets.
    int? setDelta,
    /// The delta for the rest time.
    int? restDelta,
    /// The delta for the buffer.
    int? bufDelta,
    /// The URL of a video demonstrating the progression step.
    String? videoUrl,
  }) = _ExerciseProgressionStep;

  /// Creates a new exercise progression step from a JSON object.
  factory ExerciseProgressionStep.fromJson(Map<String, dynamic> json) =>
      _$ExerciseProgressionStepFromJson(json);
}

/// Represents the weekly plan for an exercise.
@freezed
class ExerciseWeekPlan with _$ExerciseWeekPlan {
  /// Creates a new exercise week plan.
  const factory ExerciseWeekPlan({
    /// The week number.
    required int week,
    /// The number of sets to perform.
    required int sets,
    /// The number of reps to perform.
    required String reps,
    /// The rest time in seconds between sets.
    required int restSeconds,
    /// The time under tension for the exercise.
    String? tut,
    /// The buffer for the exercise.
    int? buf,
    /// The intensity of the exercise.
    String? intensity,
    /// An optional note for the week plan.
    String? note,
    /// The URL of a video demonstrating the week plan.
    String? videoUrl,
    /// Whether the week plan is inherited from another week.
    @Default(false) bool inherited,
    /// The week number from which the plan is inherited.
    int? inheritSourceWeek,
  }) = _ExerciseWeekPlan;

  /// Creates a new exercise week plan from a JSON object.
  factory ExerciseWeekPlan.fromJson(Map<String, dynamic> json) =>
      _$ExerciseWeekPlanFromJson(json);
}
