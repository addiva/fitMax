import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_program.freezed.dart';
part 'training_program.g.dart';

@freezed
class WorkoutProgram with _$WorkoutProgram {
  const factory WorkoutProgram({
    required String id,
    required String name,
    String? note,
    @Default(WeeksConfig(total: 4)) WeeksConfig weeks,
    @Default([]) List<WorkoutExercise> exercises,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default([]) List<String> tags,
  }) = _WorkoutProgram;

  factory WorkoutProgram.fromJson(Map<String, dynamic> json) =>
      _$WorkoutProgramFromJson(json);
}

@freezed
class WeeksConfig with _$WeeksConfig {
  const factory WeeksConfig({required int total, int? deload}) = _WeeksConfig;

  factory WeeksConfig.fromJson(Map<String, dynamic> json) =>
      _$WeeksConfigFromJson(json);
}

@freezed
class WorkoutExercise with _$WorkoutExercise {
  const factory WorkoutExercise({
    required String id,
    required String name,
    String? category,
    String? note,
    String? videoUrl,
    @Default([]) List<ExerciseProgressionStep> progression,
    @Default([]) List<ExerciseWeekPlan> weeks,
  }) = _WorkoutExercise;

  factory WorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$WorkoutExerciseFromJson(json);
}

@freezed
class ExerciseProgressionStep with _$ExerciseProgressionStep {
  const factory ExerciseProgressionStep({
    int? inherit,
    int? weekOffset,
    int? sets,
    String? reps,
    int? restSeconds,
    String? tut,
    int? buf,
    String? intensity,
    String? note,
    int? setDelta,
    int? restDelta,
    int? bufDelta,
    String? videoUrl,
  }) = _ExerciseProgressionStep;

  factory ExerciseProgressionStep.fromJson(Map<String, dynamic> json) =>
      _$ExerciseProgressionStepFromJson(json);
}

@freezed
class ExerciseWeekPlan with _$ExerciseWeekPlan {
  const factory ExerciseWeekPlan({
    required int week,
    required int sets,
    required String reps,
    required int restSeconds,
    String? tut,
    int? buf,
    String? intensity,
    String? note,
    String? videoUrl,
    @Default(false) bool inherited,
    int? inheritSourceWeek,
  }) = _ExerciseWeekPlan;

  factory ExerciseWeekPlan.fromJson(Map<String, dynamic> json) =>
      _$ExerciseWeekPlanFromJson(json);
}
