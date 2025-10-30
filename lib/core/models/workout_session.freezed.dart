// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkoutSession _$WorkoutSessionFromJson(Map<String, dynamic> json) {
  return _WorkoutSession.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSession {
  String get id => throw _privateConstructorUsedError;
  String get programId => throw _privateConstructorUsedError;
  String get programName => throw _privateConstructorUsedError;
  int get week => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  List<ExerciseSession> get exercises => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSessionCopyWith<WorkoutSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSessionCopyWith<$Res> {
  factory $WorkoutSessionCopyWith(
    WorkoutSession value,
    $Res Function(WorkoutSession) then,
  ) = _$WorkoutSessionCopyWithImpl<$Res, WorkoutSession>;
  @useResult
  $Res call({
    String id,
    String programId,
    String programName,
    int week,
    DateTime startedAt,
    DateTime? completedAt,
    List<ExerciseSession> exercises,
    String? notes,
  });
}

/// @nodoc
class _$WorkoutSessionCopyWithImpl<$Res, $Val extends WorkoutSession>
    implements $WorkoutSessionCopyWith<$Res> {
  _$WorkoutSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? programId = null,
    Object? programName = null,
    Object? week = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? exercises = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            programId: null == programId
                ? _value.programId
                : programId // ignore: cast_nullable_to_non_nullable
                      as String,
            programName: null == programName
                ? _value.programName
                : programName // ignore: cast_nullable_to_non_nullable
                      as String,
            week: null == week
                ? _value.week
                : week // ignore: cast_nullable_to_non_nullable
                      as int,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<ExerciseSession>,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutSessionImplCopyWith<$Res>
    implements $WorkoutSessionCopyWith<$Res> {
  factory _$$WorkoutSessionImplCopyWith(
    _$WorkoutSessionImpl value,
    $Res Function(_$WorkoutSessionImpl) then,
  ) = __$$WorkoutSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String programId,
    String programName,
    int week,
    DateTime startedAt,
    DateTime? completedAt,
    List<ExerciseSession> exercises,
    String? notes,
  });
}

/// @nodoc
class __$$WorkoutSessionImplCopyWithImpl<$Res>
    extends _$WorkoutSessionCopyWithImpl<$Res, _$WorkoutSessionImpl>
    implements _$$WorkoutSessionImplCopyWith<$Res> {
  __$$WorkoutSessionImplCopyWithImpl(
    _$WorkoutSessionImpl _value,
    $Res Function(_$WorkoutSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? programId = null,
    Object? programName = null,
    Object? week = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? exercises = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$WorkoutSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        programId: null == programId
            ? _value.programId
            : programId // ignore: cast_nullable_to_non_nullable
                  as String,
        programName: null == programName
            ? _value.programName
            : programName // ignore: cast_nullable_to_non_nullable
                  as String,
        week: null == week
            ? _value.week
            : week // ignore: cast_nullable_to_non_nullable
                  as int,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<ExerciseSession>,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSessionImpl implements _WorkoutSession {
  const _$WorkoutSessionImpl({
    required this.id,
    required this.programId,
    required this.programName,
    required this.week,
    required this.startedAt,
    this.completedAt,
    required final List<ExerciseSession> exercises,
    this.notes,
  }) : _exercises = exercises;

  factory _$WorkoutSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String programId;
  @override
  final String programName;
  @override
  final int week;
  @override
  final DateTime startedAt;
  @override
  final DateTime? completedAt;
  final List<ExerciseSession> _exercises;
  @override
  List<ExerciseSession> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  final String? notes;

  @override
  String toString() {
    return 'WorkoutSession(id: $id, programId: $programId, programName: $programName, week: $week, startedAt: $startedAt, completedAt: $completedAt, exercises: $exercises, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.programId, programId) ||
                other.programId == programId) &&
            (identical(other.programName, programName) ||
                other.programName == programName) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    programId,
    programName,
    week,
    startedAt,
    completedAt,
    const DeepCollectionEquality().hash(_exercises),
    notes,
  );

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSessionImplCopyWith<_$WorkoutSessionImpl> get copyWith =>
      __$$WorkoutSessionImplCopyWithImpl<_$WorkoutSessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSessionImplToJson(this);
  }
}

abstract class _WorkoutSession implements WorkoutSession {
  const factory _WorkoutSession({
    required final String id,
    required final String programId,
    required final String programName,
    required final int week,
    required final DateTime startedAt,
    final DateTime? completedAt,
    required final List<ExerciseSession> exercises,
    final String? notes,
  }) = _$WorkoutSessionImpl;

  factory _WorkoutSession.fromJson(Map<String, dynamic> json) =
      _$WorkoutSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get programId;
  @override
  String get programName;
  @override
  int get week;
  @override
  DateTime get startedAt;
  @override
  DateTime? get completedAt;
  @override
  List<ExerciseSession> get exercises;
  @override
  String? get notes;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSessionImplCopyWith<_$WorkoutSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseSession _$ExerciseSessionFromJson(Map<String, dynamic> json) {
  return _ExerciseSession.fromJson(json);
}

/// @nodoc
mixin _$ExerciseSession {
  String get exerciseId => throw _privateConstructorUsedError;
  String get exerciseName => throw _privateConstructorUsedError;
  List<SetLog> get sets => throw _privateConstructorUsedError;
  int? get restSecondsTarget => throw _privateConstructorUsedError;
  String? get tut => throw _privateConstructorUsedError;
  int? get buf => throw _privateConstructorUsedError;
  String? get intensity => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  String? get repsTarget => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this ExerciseSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseSessionCopyWith<ExerciseSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseSessionCopyWith<$Res> {
  factory $ExerciseSessionCopyWith(
    ExerciseSession value,
    $Res Function(ExerciseSession) then,
  ) = _$ExerciseSessionCopyWithImpl<$Res, ExerciseSession>;
  @useResult
  $Res call({
    String exerciseId,
    String exerciseName,
    List<SetLog> sets,
    int? restSecondsTarget,
    String? tut,
    int? buf,
    String? intensity,
    String? videoUrl,
    String? repsTarget,
    String? note,
    String? category,
  });
}

/// @nodoc
class _$ExerciseSessionCopyWithImpl<$Res, $Val extends ExerciseSession>
    implements $ExerciseSessionCopyWith<$Res> {
  _$ExerciseSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? sets = null,
    Object? restSecondsTarget = freezed,
    Object? tut = freezed,
    Object? buf = freezed,
    Object? intensity = freezed,
    Object? videoUrl = freezed,
    Object? repsTarget = freezed,
    Object? note = freezed,
    Object? category = freezed,
  }) {
    return _then(
      _value.copyWith(
            exerciseId: null == exerciseId
                ? _value.exerciseId
                : exerciseId // ignore: cast_nullable_to_non_nullable
                      as String,
            exerciseName: null == exerciseName
                ? _value.exerciseName
                : exerciseName // ignore: cast_nullable_to_non_nullable
                      as String,
            sets: null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as List<SetLog>,
            restSecondsTarget: freezed == restSecondsTarget
                ? _value.restSecondsTarget
                : restSecondsTarget // ignore: cast_nullable_to_non_nullable
                      as int?,
            tut: freezed == tut
                ? _value.tut
                : tut // ignore: cast_nullable_to_non_nullable
                      as String?,
            buf: freezed == buf
                ? _value.buf
                : buf // ignore: cast_nullable_to_non_nullable
                      as int?,
            intensity: freezed == intensity
                ? _value.intensity
                : intensity // ignore: cast_nullable_to_non_nullable
                      as String?,
            videoUrl: freezed == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            repsTarget: freezed == repsTarget
                ? _value.repsTarget
                : repsTarget // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseSessionImplCopyWith<$Res>
    implements $ExerciseSessionCopyWith<$Res> {
  factory _$$ExerciseSessionImplCopyWith(
    _$ExerciseSessionImpl value,
    $Res Function(_$ExerciseSessionImpl) then,
  ) = __$$ExerciseSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String exerciseId,
    String exerciseName,
    List<SetLog> sets,
    int? restSecondsTarget,
    String? tut,
    int? buf,
    String? intensity,
    String? videoUrl,
    String? repsTarget,
    String? note,
    String? category,
  });
}

/// @nodoc
class __$$ExerciseSessionImplCopyWithImpl<$Res>
    extends _$ExerciseSessionCopyWithImpl<$Res, _$ExerciseSessionImpl>
    implements _$$ExerciseSessionImplCopyWith<$Res> {
  __$$ExerciseSessionImplCopyWithImpl(
    _$ExerciseSessionImpl _value,
    $Res Function(_$ExerciseSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? sets = null,
    Object? restSecondsTarget = freezed,
    Object? tut = freezed,
    Object? buf = freezed,
    Object? intensity = freezed,
    Object? videoUrl = freezed,
    Object? repsTarget = freezed,
    Object? note = freezed,
    Object? category = freezed,
  }) {
    return _then(
      _$ExerciseSessionImpl(
        exerciseId: null == exerciseId
            ? _value.exerciseId
            : exerciseId // ignore: cast_nullable_to_non_nullable
                  as String,
        exerciseName: null == exerciseName
            ? _value.exerciseName
            : exerciseName // ignore: cast_nullable_to_non_nullable
                  as String,
        sets: null == sets
            ? _value._sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as List<SetLog>,
        restSecondsTarget: freezed == restSecondsTarget
            ? _value.restSecondsTarget
            : restSecondsTarget // ignore: cast_nullable_to_non_nullable
                  as int?,
        tut: freezed == tut
            ? _value.tut
            : tut // ignore: cast_nullable_to_non_nullable
                  as String?,
        buf: freezed == buf
            ? _value.buf
            : buf // ignore: cast_nullable_to_non_nullable
                  as int?,
        intensity: freezed == intensity
            ? _value.intensity
            : intensity // ignore: cast_nullable_to_non_nullable
                  as String?,
        videoUrl: freezed == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        repsTarget: freezed == repsTarget
            ? _value.repsTarget
            : repsTarget // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseSessionImpl implements _ExerciseSession {
  const _$ExerciseSessionImpl({
    required this.exerciseId,
    required this.exerciseName,
    final List<SetLog> sets = const [],
    this.restSecondsTarget,
    this.tut,
    this.buf,
    this.intensity,
    this.videoUrl,
    this.repsTarget,
    this.note,
    this.category,
  }) : _sets = sets;

  factory _$ExerciseSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseSessionImplFromJson(json);

  @override
  final String exerciseId;
  @override
  final String exerciseName;
  final List<SetLog> _sets;
  @override
  @JsonKey()
  List<SetLog> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  final int? restSecondsTarget;
  @override
  final String? tut;
  @override
  final int? buf;
  @override
  final String? intensity;
  @override
  final String? videoUrl;
  @override
  final String? repsTarget;
  @override
  final String? note;
  @override
  final String? category;

  @override
  String toString() {
    return 'ExerciseSession(exerciseId: $exerciseId, exerciseName: $exerciseName, sets: $sets, restSecondsTarget: $restSecondsTarget, tut: $tut, buf: $buf, intensity: $intensity, videoUrl: $videoUrl, repsTarget: $repsTarget, note: $note, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseSessionImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            (identical(other.restSecondsTarget, restSecondsTarget) ||
                other.restSecondsTarget == restSecondsTarget) &&
            (identical(other.tut, tut) || other.tut == tut) &&
            (identical(other.buf, buf) || other.buf == buf) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.repsTarget, repsTarget) ||
                other.repsTarget == repsTarget) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    exerciseId,
    exerciseName,
    const DeepCollectionEquality().hash(_sets),
    restSecondsTarget,
    tut,
    buf,
    intensity,
    videoUrl,
    repsTarget,
    note,
    category,
  );

  /// Create a copy of ExerciseSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseSessionImplCopyWith<_$ExerciseSessionImpl> get copyWith =>
      __$$ExerciseSessionImplCopyWithImpl<_$ExerciseSessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseSessionImplToJson(this);
  }
}

abstract class _ExerciseSession implements ExerciseSession {
  const factory _ExerciseSession({
    required final String exerciseId,
    required final String exerciseName,
    final List<SetLog> sets,
    final int? restSecondsTarget,
    final String? tut,
    final int? buf,
    final String? intensity,
    final String? videoUrl,
    final String? repsTarget,
    final String? note,
    final String? category,
  }) = _$ExerciseSessionImpl;

  factory _ExerciseSession.fromJson(Map<String, dynamic> json) =
      _$ExerciseSessionImpl.fromJson;

  @override
  String get exerciseId;
  @override
  String get exerciseName;
  @override
  List<SetLog> get sets;
  @override
  int? get restSecondsTarget;
  @override
  String? get tut;
  @override
  int? get buf;
  @override
  String? get intensity;
  @override
  String? get videoUrl;
  @override
  String? get repsTarget;
  @override
  String? get note;
  @override
  String? get category;

  /// Create a copy of ExerciseSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseSessionImplCopyWith<_$ExerciseSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SetLog _$SetLogFromJson(Map<String, dynamic> json) {
  return _SetLog.fromJson(json);
}

/// @nodoc
mixin _$SetLog {
  int get index => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  int? get reps => throw _privateConstructorUsedError;
  @DurationSecondsConverter()
  Duration? get rest => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this SetLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetLogCopyWith<SetLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetLogCopyWith<$Res> {
  factory $SetLogCopyWith(SetLog value, $Res Function(SetLog) then) =
      _$SetLogCopyWithImpl<$Res, SetLog>;
  @useResult
  $Res call({
    int index,
    double? weight,
    int? reps,
    @DurationSecondsConverter() Duration? rest,
    String? note,
  });
}

/// @nodoc
class _$SetLogCopyWithImpl<$Res, $Val extends SetLog>
    implements $SetLogCopyWith<$Res> {
  _$SetLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? weight = freezed,
    Object? reps = freezed,
    Object? rest = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _value.copyWith(
            index: null == index
                ? _value.index
                : index // ignore: cast_nullable_to_non_nullable
                      as int,
            weight: freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double?,
            reps: freezed == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as int?,
            rest: freezed == rest
                ? _value.rest
                : rest // ignore: cast_nullable_to_non_nullable
                      as Duration?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SetLogImplCopyWith<$Res> implements $SetLogCopyWith<$Res> {
  factory _$$SetLogImplCopyWith(
    _$SetLogImpl value,
    $Res Function(_$SetLogImpl) then,
  ) = __$$SetLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int index,
    double? weight,
    int? reps,
    @DurationSecondsConverter() Duration? rest,
    String? note,
  });
}

/// @nodoc
class __$$SetLogImplCopyWithImpl<$Res>
    extends _$SetLogCopyWithImpl<$Res, _$SetLogImpl>
    implements _$$SetLogImplCopyWith<$Res> {
  __$$SetLogImplCopyWithImpl(
    _$SetLogImpl _value,
    $Res Function(_$SetLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SetLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? weight = freezed,
    Object? reps = freezed,
    Object? rest = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _$SetLogImpl(
        index: null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: freezed == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double?,
        reps: freezed == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as int?,
        rest: freezed == rest
            ? _value.rest
            : rest // ignore: cast_nullable_to_non_nullable
                  as Duration?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SetLogImpl implements _SetLog {
  const _$SetLogImpl({
    required this.index,
    this.weight,
    this.reps,
    @DurationSecondsConverter() this.rest,
    this.note,
  });

  factory _$SetLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetLogImplFromJson(json);

  @override
  final int index;
  @override
  final double? weight;
  @override
  final int? reps;
  @override
  @DurationSecondsConverter()
  final Duration? rest;
  @override
  final String? note;

  @override
  String toString() {
    return 'SetLog(index: $index, weight: $weight, reps: $reps, rest: $rest, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetLogImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.rest, rest) || other.rest == rest) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, index, weight, reps, rest, note);

  /// Create a copy of SetLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetLogImplCopyWith<_$SetLogImpl> get copyWith =>
      __$$SetLogImplCopyWithImpl<_$SetLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetLogImplToJson(this);
  }
}

abstract class _SetLog implements SetLog {
  const factory _SetLog({
    required final int index,
    final double? weight,
    final int? reps,
    @DurationSecondsConverter() final Duration? rest,
    final String? note,
  }) = _$SetLogImpl;

  factory _SetLog.fromJson(Map<String, dynamic> json) = _$SetLogImpl.fromJson;

  @override
  int get index;
  @override
  double? get weight;
  @override
  int? get reps;
  @override
  @DurationSecondsConverter()
  Duration? get rest;
  @override
  String? get note;

  /// Create a copy of SetLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetLogImplCopyWith<_$SetLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
