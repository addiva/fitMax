// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSessionImpl _$$WorkoutSessionImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutSessionImpl(
      id: json['id'] as String,
      programId: json['programId'] as String,
      programName: json['programName'] as String,
      week: (json['week'] as num).toInt(),
      startedAt: DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => ExerciseSession.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$WorkoutSessionImplToJson(
  _$WorkoutSessionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'programId': instance.programId,
  'programName': instance.programName,
  'week': instance.week,
  'startedAt': instance.startedAt.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
  'exercises': instance.exercises,
  'notes': instance.notes,
};

_$ExerciseSessionImpl _$$ExerciseSessionImplFromJson(
  Map<String, dynamic> json,
) => _$ExerciseSessionImpl(
  exerciseId: json['exerciseId'] as String,
  exerciseName: json['exerciseName'] as String,
  sets:
      (json['sets'] as List<dynamic>?)
          ?.map((e) => SetLog.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  restSecondsTarget: (json['restSecondsTarget'] as num?)?.toInt(),
  tut: json['tut'] as String?,
  buf: (json['buf'] as num?)?.toInt(),
  intensity: json['intensity'] as String?,
  videoUrl: json['videoUrl'] as String?,
  repsTarget: json['repsTarget'] as String?,
  note: json['note'] as String?,
  category: json['category'] as String?,
);

Map<String, dynamic> _$$ExerciseSessionImplToJson(
  _$ExerciseSessionImpl instance,
) => <String, dynamic>{
  'exerciseId': instance.exerciseId,
  'exerciseName': instance.exerciseName,
  'sets': instance.sets,
  'restSecondsTarget': instance.restSecondsTarget,
  'tut': instance.tut,
  'buf': instance.buf,
  'intensity': instance.intensity,
  'videoUrl': instance.videoUrl,
  'repsTarget': instance.repsTarget,
  'note': instance.note,
  'category': instance.category,
};

_$SetLogImpl _$$SetLogImplFromJson(Map<String, dynamic> json) => _$SetLogImpl(
  index: (json['index'] as num).toInt(),
  weight: (json['weight'] as num?)?.toDouble(),
  reps: (json['reps'] as num?)?.toInt(),
  rest: const DurationSecondsConverter().fromJson(
    (json['rest'] as num?)?.toInt(),
  ),
  note: json['note'] as String?,
);

Map<String, dynamic> _$$SetLogImplToJson(_$SetLogImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'weight': instance.weight,
      'reps': instance.reps,
      'rest': const DurationSecondsConverter().toJson(instance.rest),
      'note': instance.note,
    };
