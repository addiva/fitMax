// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutProgramImpl _$$WorkoutProgramImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutProgramImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      note: json['note'] as String?,
      weeks: json['weeks'] == null
          ? const WeeksConfig(total: 4)
          : WeeksConfig.fromJson(json['weeks'] as Map<String, dynamic>),
      exercises:
          (json['exercises'] as List<dynamic>?)
              ?.map((e) => WorkoutExercise.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$$WorkoutProgramImplToJson(
  _$WorkoutProgramImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'note': instance.note,
  'weeks': instance.weeks,
  'exercises': instance.exercises,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'tags': instance.tags,
};

_$WeeksConfigImpl _$$WeeksConfigImplFromJson(Map<String, dynamic> json) =>
    _$WeeksConfigImpl(
      total: (json['total'] as num).toInt(),
      deload: (json['deload'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WeeksConfigImplToJson(_$WeeksConfigImpl instance) =>
    <String, dynamic>{'total': instance.total, 'deload': instance.deload};

_$WorkoutExerciseImpl _$$WorkoutExerciseImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutExerciseImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  category: json['category'] as String?,
  note: json['note'] as String?,
  videoUrl: json['videoUrl'] as String?,
  progression:
      (json['progression'] as List<dynamic>?)
          ?.map(
            (e) => ExerciseProgressionStep.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  weeks:
      (json['weeks'] as List<dynamic>?)
          ?.map((e) => ExerciseWeekPlan.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$WorkoutExerciseImplToJson(
  _$WorkoutExerciseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': instance.category,
  'note': instance.note,
  'videoUrl': instance.videoUrl,
  'progression': instance.progression,
  'weeks': instance.weeks,
};

_$ExerciseProgressionStepImpl _$$ExerciseProgressionStepImplFromJson(
  Map<String, dynamic> json,
) => _$ExerciseProgressionStepImpl(
  inherit: (json['inherit'] as num?)?.toInt(),
  weekOffset: (json['weekOffset'] as num?)?.toInt(),
  sets: (json['sets'] as num?)?.toInt(),
  reps: json['reps'] as String?,
  restSeconds: (json['restSeconds'] as num?)?.toInt(),
  tut: json['tut'] as String?,
  buf: (json['buf'] as num?)?.toInt(),
  intensity: json['intensity'] as String?,
  note: json['note'] as String?,
  setDelta: (json['setDelta'] as num?)?.toInt(),
  restDelta: (json['restDelta'] as num?)?.toInt(),
  bufDelta: (json['bufDelta'] as num?)?.toInt(),
  videoUrl: json['videoUrl'] as String?,
);

Map<String, dynamic> _$$ExerciseProgressionStepImplToJson(
  _$ExerciseProgressionStepImpl instance,
) => <String, dynamic>{
  'inherit': instance.inherit,
  'weekOffset': instance.weekOffset,
  'sets': instance.sets,
  'reps': instance.reps,
  'restSeconds': instance.restSeconds,
  'tut': instance.tut,
  'buf': instance.buf,
  'intensity': instance.intensity,
  'note': instance.note,
  'setDelta': instance.setDelta,
  'restDelta': instance.restDelta,
  'bufDelta': instance.bufDelta,
  'videoUrl': instance.videoUrl,
};

_$ExerciseWeekPlanImpl _$$ExerciseWeekPlanImplFromJson(
  Map<String, dynamic> json,
) => _$ExerciseWeekPlanImpl(
  week: (json['week'] as num).toInt(),
  sets: (json['sets'] as num).toInt(),
  reps: json['reps'] as String,
  restSeconds: (json['restSeconds'] as num).toInt(),
  tut: json['tut'] as String?,
  buf: (json['buf'] as num?)?.toInt(),
  intensity: json['intensity'] as String?,
  note: json['note'] as String?,
  videoUrl: json['videoUrl'] as String?,
  inherited: json['inherited'] as bool? ?? false,
  inheritSourceWeek: (json['inheritSourceWeek'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ExerciseWeekPlanImplToJson(
  _$ExerciseWeekPlanImpl instance,
) => <String, dynamic>{
  'week': instance.week,
  'sets': instance.sets,
  'reps': instance.reps,
  'restSeconds': instance.restSeconds,
  'tut': instance.tut,
  'buf': instance.buf,
  'intensity': instance.intensity,
  'note': instance.note,
  'videoUrl': instance.videoUrl,
  'inherited': instance.inherited,
  'inheritSourceWeek': instance.inheritSourceWeek,
};
