// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkoutProgram _$WorkoutProgramFromJson(Map<String, dynamic> json) {
  return _WorkoutProgram.fromJson(json);
}

/// @nodoc
mixin _$WorkoutProgram {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  WeeksConfig get weeks => throw _privateConstructorUsedError;
  List<WorkoutExercise> get exercises => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  /// Serializes this WorkoutProgram to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutProgramCopyWith<WorkoutProgram> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutProgramCopyWith<$Res> {
  factory $WorkoutProgramCopyWith(
    WorkoutProgram value,
    $Res Function(WorkoutProgram) then,
  ) = _$WorkoutProgramCopyWithImpl<$Res, WorkoutProgram>;
  @useResult
  $Res call({
    String id,
    String name,
    String? note,
    WeeksConfig weeks,
    List<WorkoutExercise> exercises,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String> tags,
  });

  $WeeksConfigCopyWith<$Res> get weeks;
}

/// @nodoc
class _$WorkoutProgramCopyWithImpl<$Res, $Val extends WorkoutProgram>
    implements $WorkoutProgramCopyWith<$Res> {
  _$WorkoutProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? note = freezed,
    Object? weeks = null,
    Object? exercises = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? tags = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            weeks: null == weeks
                ? _value.weeks
                : weeks // ignore: cast_nullable_to_non_nullable
                      as WeeksConfig,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutExercise>,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeeksConfigCopyWith<$Res> get weeks {
    return $WeeksConfigCopyWith<$Res>(_value.weeks, (value) {
      return _then(_value.copyWith(weeks: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkoutProgramImplCopyWith<$Res>
    implements $WorkoutProgramCopyWith<$Res> {
  factory _$$WorkoutProgramImplCopyWith(
    _$WorkoutProgramImpl value,
    $Res Function(_$WorkoutProgramImpl) then,
  ) = __$$WorkoutProgramImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? note,
    WeeksConfig weeks,
    List<WorkoutExercise> exercises,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String> tags,
  });

  @override
  $WeeksConfigCopyWith<$Res> get weeks;
}

/// @nodoc
class __$$WorkoutProgramImplCopyWithImpl<$Res>
    extends _$WorkoutProgramCopyWithImpl<$Res, _$WorkoutProgramImpl>
    implements _$$WorkoutProgramImplCopyWith<$Res> {
  __$$WorkoutProgramImplCopyWithImpl(
    _$WorkoutProgramImpl _value,
    $Res Function(_$WorkoutProgramImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? note = freezed,
    Object? weeks = null,
    Object? exercises = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? tags = null,
  }) {
    return _then(
      _$WorkoutProgramImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        weeks: null == weeks
            ? _value.weeks
            : weeks // ignore: cast_nullable_to_non_nullable
                  as WeeksConfig,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutExercise>,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutProgramImpl implements _WorkoutProgram {
  const _$WorkoutProgramImpl({
    required this.id,
    required this.name,
    this.note,
    this.weeks = const WeeksConfig(total: 4),
    final List<WorkoutExercise> exercises = const [],
    this.createdAt,
    this.updatedAt,
    final List<String> tags = const [],
  }) : _exercises = exercises,
       _tags = tags;

  factory _$WorkoutProgramImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutProgramImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? note;
  @override
  @JsonKey()
  final WeeksConfig weeks;
  final List<WorkoutExercise> _exercises;
  @override
  @JsonKey()
  List<WorkoutExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'WorkoutProgram(id: $id, name: $name, note: $note, weeks: $weeks, exercises: $exercises, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutProgramImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.weeks, weeks) || other.weeks == weeks) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    note,
    weeks,
    const DeepCollectionEquality().hash(_exercises),
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_tags),
  );

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutProgramImplCopyWith<_$WorkoutProgramImpl> get copyWith =>
      __$$WorkoutProgramImplCopyWithImpl<_$WorkoutProgramImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutProgramImplToJson(this);
  }
}

abstract class _WorkoutProgram implements WorkoutProgram {
  const factory _WorkoutProgram({
    required final String id,
    required final String name,
    final String? note,
    final WeeksConfig weeks,
    final List<WorkoutExercise> exercises,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final List<String> tags,
  }) = _$WorkoutProgramImpl;

  factory _WorkoutProgram.fromJson(Map<String, dynamic> json) =
      _$WorkoutProgramImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get note;
  @override
  WeeksConfig get weeks;
  @override
  List<WorkoutExercise> get exercises;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  List<String> get tags;

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutProgramImplCopyWith<_$WorkoutProgramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeksConfig _$WeeksConfigFromJson(Map<String, dynamic> json) {
  return _WeeksConfig.fromJson(json);
}

/// @nodoc
mixin _$WeeksConfig {
  int get total => throw _privateConstructorUsedError;
  int? get deload => throw _privateConstructorUsedError;

  /// Serializes this WeeksConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeksConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeksConfigCopyWith<WeeksConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeksConfigCopyWith<$Res> {
  factory $WeeksConfigCopyWith(
    WeeksConfig value,
    $Res Function(WeeksConfig) then,
  ) = _$WeeksConfigCopyWithImpl<$Res, WeeksConfig>;
  @useResult
  $Res call({int total, int? deload});
}

/// @nodoc
class _$WeeksConfigCopyWithImpl<$Res, $Val extends WeeksConfig>
    implements $WeeksConfigCopyWith<$Res> {
  _$WeeksConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeksConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = null, Object? deload = freezed}) {
    return _then(
      _value.copyWith(
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            deload: freezed == deload
                ? _value.deload
                : deload // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeeksConfigImplCopyWith<$Res>
    implements $WeeksConfigCopyWith<$Res> {
  factory _$$WeeksConfigImplCopyWith(
    _$WeeksConfigImpl value,
    $Res Function(_$WeeksConfigImpl) then,
  ) = __$$WeeksConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int? deload});
}

/// @nodoc
class __$$WeeksConfigImplCopyWithImpl<$Res>
    extends _$WeeksConfigCopyWithImpl<$Res, _$WeeksConfigImpl>
    implements _$$WeeksConfigImplCopyWith<$Res> {
  __$$WeeksConfigImplCopyWithImpl(
    _$WeeksConfigImpl _value,
    $Res Function(_$WeeksConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeksConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = null, Object? deload = freezed}) {
    return _then(
      _$WeeksConfigImpl(
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        deload: freezed == deload
            ? _value.deload
            : deload // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeksConfigImpl implements _WeeksConfig {
  const _$WeeksConfigImpl({required this.total, this.deload});

  factory _$WeeksConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeksConfigImplFromJson(json);

  @override
  final int total;
  @override
  final int? deload;

  @override
  String toString() {
    return 'WeeksConfig(total: $total, deload: $deload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeksConfigImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.deload, deload) || other.deload == deload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, deload);

  /// Create a copy of WeeksConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeksConfigImplCopyWith<_$WeeksConfigImpl> get copyWith =>
      __$$WeeksConfigImplCopyWithImpl<_$WeeksConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeksConfigImplToJson(this);
  }
}

abstract class _WeeksConfig implements WeeksConfig {
  const factory _WeeksConfig({required final int total, final int? deload}) =
      _$WeeksConfigImpl;

  factory _WeeksConfig.fromJson(Map<String, dynamic> json) =
      _$WeeksConfigImpl.fromJson;

  @override
  int get total;
  @override
  int? get deload;

  /// Create a copy of WeeksConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeksConfigImplCopyWith<_$WeeksConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkoutExercise _$WorkoutExerciseFromJson(Map<String, dynamic> json) {
  return _WorkoutExercise.fromJson(json);
}

/// @nodoc
mixin _$WorkoutExercise {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  List<ExerciseProgressionStep> get progression =>
      throw _privateConstructorUsedError;
  List<ExerciseWeekPlan> get weeks => throw _privateConstructorUsedError;

  /// Serializes this WorkoutExercise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutExerciseCopyWith<WorkoutExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutExerciseCopyWith<$Res> {
  factory $WorkoutExerciseCopyWith(
    WorkoutExercise value,
    $Res Function(WorkoutExercise) then,
  ) = _$WorkoutExerciseCopyWithImpl<$Res, WorkoutExercise>;
  @useResult
  $Res call({
    String id,
    String name,
    String? category,
    String? note,
    String? videoUrl,
    List<ExerciseProgressionStep> progression,
    List<ExerciseWeekPlan> weeks,
  });
}

/// @nodoc
class _$WorkoutExerciseCopyWithImpl<$Res, $Val extends WorkoutExercise>
    implements $WorkoutExerciseCopyWith<$Res> {
  _$WorkoutExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = freezed,
    Object? note = freezed,
    Object? videoUrl = freezed,
    Object? progression = null,
    Object? weeks = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            videoUrl: freezed == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            progression: null == progression
                ? _value.progression
                : progression // ignore: cast_nullable_to_non_nullable
                      as List<ExerciseProgressionStep>,
            weeks: null == weeks
                ? _value.weeks
                : weeks // ignore: cast_nullable_to_non_nullable
                      as List<ExerciseWeekPlan>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutExerciseImplCopyWith<$Res>
    implements $WorkoutExerciseCopyWith<$Res> {
  factory _$$WorkoutExerciseImplCopyWith(
    _$WorkoutExerciseImpl value,
    $Res Function(_$WorkoutExerciseImpl) then,
  ) = __$$WorkoutExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? category,
    String? note,
    String? videoUrl,
    List<ExerciseProgressionStep> progression,
    List<ExerciseWeekPlan> weeks,
  });
}

/// @nodoc
class __$$WorkoutExerciseImplCopyWithImpl<$Res>
    extends _$WorkoutExerciseCopyWithImpl<$Res, _$WorkoutExerciseImpl>
    implements _$$WorkoutExerciseImplCopyWith<$Res> {
  __$$WorkoutExerciseImplCopyWithImpl(
    _$WorkoutExerciseImpl _value,
    $Res Function(_$WorkoutExerciseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = freezed,
    Object? note = freezed,
    Object? videoUrl = freezed,
    Object? progression = null,
    Object? weeks = null,
  }) {
    return _then(
      _$WorkoutExerciseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        videoUrl: freezed == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        progression: null == progression
            ? _value._progression
            : progression // ignore: cast_nullable_to_non_nullable
                  as List<ExerciseProgressionStep>,
        weeks: null == weeks
            ? _value._weeks
            : weeks // ignore: cast_nullable_to_non_nullable
                  as List<ExerciseWeekPlan>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutExerciseImpl implements _WorkoutExercise {
  const _$WorkoutExerciseImpl({
    required this.id,
    required this.name,
    this.category,
    this.note,
    this.videoUrl,
    final List<ExerciseProgressionStep> progression = const [],
    final List<ExerciseWeekPlan> weeks = const [],
  }) : _progression = progression,
       _weeks = weeks;

  factory _$WorkoutExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutExerciseImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? category;
  @override
  final String? note;
  @override
  final String? videoUrl;
  final List<ExerciseProgressionStep> _progression;
  @override
  @JsonKey()
  List<ExerciseProgressionStep> get progression {
    if (_progression is EqualUnmodifiableListView) return _progression;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_progression);
  }

  final List<ExerciseWeekPlan> _weeks;
  @override
  @JsonKey()
  List<ExerciseWeekPlan> get weeks {
    if (_weeks is EqualUnmodifiableListView) return _weeks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeks);
  }

  @override
  String toString() {
    return 'WorkoutExercise(id: $id, name: $name, category: $category, note: $note, videoUrl: $videoUrl, progression: $progression, weeks: $weeks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            const DeepCollectionEquality().equals(
              other._progression,
              _progression,
            ) &&
            const DeepCollectionEquality().equals(other._weeks, _weeks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    category,
    note,
    videoUrl,
    const DeepCollectionEquality().hash(_progression),
    const DeepCollectionEquality().hash(_weeks),
  );

  /// Create a copy of WorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutExerciseImplCopyWith<_$WorkoutExerciseImpl> get copyWith =>
      __$$WorkoutExerciseImplCopyWithImpl<_$WorkoutExerciseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutExerciseImplToJson(this);
  }
}

abstract class _WorkoutExercise implements WorkoutExercise {
  const factory _WorkoutExercise({
    required final String id,
    required final String name,
    final String? category,
    final String? note,
    final String? videoUrl,
    final List<ExerciseProgressionStep> progression,
    final List<ExerciseWeekPlan> weeks,
  }) = _$WorkoutExerciseImpl;

  factory _WorkoutExercise.fromJson(Map<String, dynamic> json) =
      _$WorkoutExerciseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get category;
  @override
  String? get note;
  @override
  String? get videoUrl;
  @override
  List<ExerciseProgressionStep> get progression;
  @override
  List<ExerciseWeekPlan> get weeks;

  /// Create a copy of WorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutExerciseImplCopyWith<_$WorkoutExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExerciseProgressionStep _$ExerciseProgressionStepFromJson(
  Map<String, dynamic> json,
) {
  return _ExerciseProgressionStep.fromJson(json);
}

/// @nodoc
mixin _$ExerciseProgressionStep {
  int? get inherit => throw _privateConstructorUsedError;
  int? get weekOffset => throw _privateConstructorUsedError;
  int? get sets => throw _privateConstructorUsedError;
  String? get reps => throw _privateConstructorUsedError;
  int? get restSeconds => throw _privateConstructorUsedError;
  String? get tut => throw _privateConstructorUsedError;
  int? get buf => throw _privateConstructorUsedError;
  String? get intensity => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  int? get setDelta => throw _privateConstructorUsedError;
  int? get restDelta => throw _privateConstructorUsedError;
  int? get bufDelta => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;

  /// Serializes this ExerciseProgressionStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseProgressionStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseProgressionStepCopyWith<ExerciseProgressionStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseProgressionStepCopyWith<$Res> {
  factory $ExerciseProgressionStepCopyWith(
    ExerciseProgressionStep value,
    $Res Function(ExerciseProgressionStep) then,
  ) = _$ExerciseProgressionStepCopyWithImpl<$Res, ExerciseProgressionStep>;
  @useResult
  $Res call({
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
  });
}

/// @nodoc
class _$ExerciseProgressionStepCopyWithImpl<
  $Res,
  $Val extends ExerciseProgressionStep
>
    implements $ExerciseProgressionStepCopyWith<$Res> {
  _$ExerciseProgressionStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseProgressionStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inherit = freezed,
    Object? weekOffset = freezed,
    Object? sets = freezed,
    Object? reps = freezed,
    Object? restSeconds = freezed,
    Object? tut = freezed,
    Object? buf = freezed,
    Object? intensity = freezed,
    Object? note = freezed,
    Object? setDelta = freezed,
    Object? restDelta = freezed,
    Object? bufDelta = freezed,
    Object? videoUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            inherit: freezed == inherit
                ? _value.inherit
                : inherit // ignore: cast_nullable_to_non_nullable
                      as int?,
            weekOffset: freezed == weekOffset
                ? _value.weekOffset
                : weekOffset // ignore: cast_nullable_to_non_nullable
                      as int?,
            sets: freezed == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as int?,
            reps: freezed == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as String?,
            restSeconds: freezed == restSeconds
                ? _value.restSeconds
                : restSeconds // ignore: cast_nullable_to_non_nullable
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
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            setDelta: freezed == setDelta
                ? _value.setDelta
                : setDelta // ignore: cast_nullable_to_non_nullable
                      as int?,
            restDelta: freezed == restDelta
                ? _value.restDelta
                : restDelta // ignore: cast_nullable_to_non_nullable
                      as int?,
            bufDelta: freezed == bufDelta
                ? _value.bufDelta
                : bufDelta // ignore: cast_nullable_to_non_nullable
                      as int?,
            videoUrl: freezed == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseProgressionStepImplCopyWith<$Res>
    implements $ExerciseProgressionStepCopyWith<$Res> {
  factory _$$ExerciseProgressionStepImplCopyWith(
    _$ExerciseProgressionStepImpl value,
    $Res Function(_$ExerciseProgressionStepImpl) then,
  ) = __$$ExerciseProgressionStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
  });
}

/// @nodoc
class __$$ExerciseProgressionStepImplCopyWithImpl<$Res>
    extends
        _$ExerciseProgressionStepCopyWithImpl<
          $Res,
          _$ExerciseProgressionStepImpl
        >
    implements _$$ExerciseProgressionStepImplCopyWith<$Res> {
  __$$ExerciseProgressionStepImplCopyWithImpl(
    _$ExerciseProgressionStepImpl _value,
    $Res Function(_$ExerciseProgressionStepImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseProgressionStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inherit = freezed,
    Object? weekOffset = freezed,
    Object? sets = freezed,
    Object? reps = freezed,
    Object? restSeconds = freezed,
    Object? tut = freezed,
    Object? buf = freezed,
    Object? intensity = freezed,
    Object? note = freezed,
    Object? setDelta = freezed,
    Object? restDelta = freezed,
    Object? bufDelta = freezed,
    Object? videoUrl = freezed,
  }) {
    return _then(
      _$ExerciseProgressionStepImpl(
        inherit: freezed == inherit
            ? _value.inherit
            : inherit // ignore: cast_nullable_to_non_nullable
                  as int?,
        weekOffset: freezed == weekOffset
            ? _value.weekOffset
            : weekOffset // ignore: cast_nullable_to_non_nullable
                  as int?,
        sets: freezed == sets
            ? _value.sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as int?,
        reps: freezed == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as String?,
        restSeconds: freezed == restSeconds
            ? _value.restSeconds
            : restSeconds // ignore: cast_nullable_to_non_nullable
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
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        setDelta: freezed == setDelta
            ? _value.setDelta
            : setDelta // ignore: cast_nullable_to_non_nullable
                  as int?,
        restDelta: freezed == restDelta
            ? _value.restDelta
            : restDelta // ignore: cast_nullable_to_non_nullable
                  as int?,
        bufDelta: freezed == bufDelta
            ? _value.bufDelta
            : bufDelta // ignore: cast_nullable_to_non_nullable
                  as int?,
        videoUrl: freezed == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseProgressionStepImpl implements _ExerciseProgressionStep {
  const _$ExerciseProgressionStepImpl({
    this.inherit,
    this.weekOffset,
    this.sets,
    this.reps,
    this.restSeconds,
    this.tut,
    this.buf,
    this.intensity,
    this.note,
    this.setDelta,
    this.restDelta,
    this.bufDelta,
    this.videoUrl,
  });

  factory _$ExerciseProgressionStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseProgressionStepImplFromJson(json);

  @override
  final int? inherit;
  @override
  final int? weekOffset;
  @override
  final int? sets;
  @override
  final String? reps;
  @override
  final int? restSeconds;
  @override
  final String? tut;
  @override
  final int? buf;
  @override
  final String? intensity;
  @override
  final String? note;
  @override
  final int? setDelta;
  @override
  final int? restDelta;
  @override
  final int? bufDelta;
  @override
  final String? videoUrl;

  @override
  String toString() {
    return 'ExerciseProgressionStep(inherit: $inherit, weekOffset: $weekOffset, sets: $sets, reps: $reps, restSeconds: $restSeconds, tut: $tut, buf: $buf, intensity: $intensity, note: $note, setDelta: $setDelta, restDelta: $restDelta, bufDelta: $bufDelta, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseProgressionStepImpl &&
            (identical(other.inherit, inherit) || other.inherit == inherit) &&
            (identical(other.weekOffset, weekOffset) ||
                other.weekOffset == weekOffset) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.restSeconds, restSeconds) ||
                other.restSeconds == restSeconds) &&
            (identical(other.tut, tut) || other.tut == tut) &&
            (identical(other.buf, buf) || other.buf == buf) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.setDelta, setDelta) ||
                other.setDelta == setDelta) &&
            (identical(other.restDelta, restDelta) ||
                other.restDelta == restDelta) &&
            (identical(other.bufDelta, bufDelta) ||
                other.bufDelta == bufDelta) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    inherit,
    weekOffset,
    sets,
    reps,
    restSeconds,
    tut,
    buf,
    intensity,
    note,
    setDelta,
    restDelta,
    bufDelta,
    videoUrl,
  );

  /// Create a copy of ExerciseProgressionStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseProgressionStepImplCopyWith<_$ExerciseProgressionStepImpl>
  get copyWith =>
      __$$ExerciseProgressionStepImplCopyWithImpl<
        _$ExerciseProgressionStepImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseProgressionStepImplToJson(this);
  }
}

abstract class _ExerciseProgressionStep implements ExerciseProgressionStep {
  const factory _ExerciseProgressionStep({
    final int? inherit,
    final int? weekOffset,
    final int? sets,
    final String? reps,
    final int? restSeconds,
    final String? tut,
    final int? buf,
    final String? intensity,
    final String? note,
    final int? setDelta,
    final int? restDelta,
    final int? bufDelta,
    final String? videoUrl,
  }) = _$ExerciseProgressionStepImpl;

  factory _ExerciseProgressionStep.fromJson(Map<String, dynamic> json) =
      _$ExerciseProgressionStepImpl.fromJson;

  @override
  int? get inherit;
  @override
  int? get weekOffset;
  @override
  int? get sets;
  @override
  String? get reps;
  @override
  int? get restSeconds;
  @override
  String? get tut;
  @override
  int? get buf;
  @override
  String? get intensity;
  @override
  String? get note;
  @override
  int? get setDelta;
  @override
  int? get restDelta;
  @override
  int? get bufDelta;
  @override
  String? get videoUrl;

  /// Create a copy of ExerciseProgressionStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseProgressionStepImplCopyWith<_$ExerciseProgressionStepImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ExerciseWeekPlan _$ExerciseWeekPlanFromJson(Map<String, dynamic> json) {
  return _ExerciseWeekPlan.fromJson(json);
}

/// @nodoc
mixin _$ExerciseWeekPlan {
  int get week => throw _privateConstructorUsedError;
  int get sets => throw _privateConstructorUsedError;
  String get reps => throw _privateConstructorUsedError;
  int get restSeconds => throw _privateConstructorUsedError;
  String? get tut => throw _privateConstructorUsedError;
  int? get buf => throw _privateConstructorUsedError;
  String? get intensity => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  bool get inherited => throw _privateConstructorUsedError;
  int? get inheritSourceWeek => throw _privateConstructorUsedError;

  /// Serializes this ExerciseWeekPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseWeekPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseWeekPlanCopyWith<ExerciseWeekPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseWeekPlanCopyWith<$Res> {
  factory $ExerciseWeekPlanCopyWith(
    ExerciseWeekPlan value,
    $Res Function(ExerciseWeekPlan) then,
  ) = _$ExerciseWeekPlanCopyWithImpl<$Res, ExerciseWeekPlan>;
  @useResult
  $Res call({
    int week,
    int sets,
    String reps,
    int restSeconds,
    String? tut,
    int? buf,
    String? intensity,
    String? note,
    String? videoUrl,
    bool inherited,
    int? inheritSourceWeek,
  });
}

/// @nodoc
class _$ExerciseWeekPlanCopyWithImpl<$Res, $Val extends ExerciseWeekPlan>
    implements $ExerciseWeekPlanCopyWith<$Res> {
  _$ExerciseWeekPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseWeekPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? sets = null,
    Object? reps = null,
    Object? restSeconds = null,
    Object? tut = freezed,
    Object? buf = freezed,
    Object? intensity = freezed,
    Object? note = freezed,
    Object? videoUrl = freezed,
    Object? inherited = null,
    Object? inheritSourceWeek = freezed,
  }) {
    return _then(
      _value.copyWith(
            week: null == week
                ? _value.week
                : week // ignore: cast_nullable_to_non_nullable
                      as int,
            sets: null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as int,
            reps: null == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as String,
            restSeconds: null == restSeconds
                ? _value.restSeconds
                : restSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
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
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            videoUrl: freezed == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            inherited: null == inherited
                ? _value.inherited
                : inherited // ignore: cast_nullable_to_non_nullable
                      as bool,
            inheritSourceWeek: freezed == inheritSourceWeek
                ? _value.inheritSourceWeek
                : inheritSourceWeek // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseWeekPlanImplCopyWith<$Res>
    implements $ExerciseWeekPlanCopyWith<$Res> {
  factory _$$ExerciseWeekPlanImplCopyWith(
    _$ExerciseWeekPlanImpl value,
    $Res Function(_$ExerciseWeekPlanImpl) then,
  ) = __$$ExerciseWeekPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int week,
    int sets,
    String reps,
    int restSeconds,
    String? tut,
    int? buf,
    String? intensity,
    String? note,
    String? videoUrl,
    bool inherited,
    int? inheritSourceWeek,
  });
}

/// @nodoc
class __$$ExerciseWeekPlanImplCopyWithImpl<$Res>
    extends _$ExerciseWeekPlanCopyWithImpl<$Res, _$ExerciseWeekPlanImpl>
    implements _$$ExerciseWeekPlanImplCopyWith<$Res> {
  __$$ExerciseWeekPlanImplCopyWithImpl(
    _$ExerciseWeekPlanImpl _value,
    $Res Function(_$ExerciseWeekPlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseWeekPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? week = null,
    Object? sets = null,
    Object? reps = null,
    Object? restSeconds = null,
    Object? tut = freezed,
    Object? buf = freezed,
    Object? intensity = freezed,
    Object? note = freezed,
    Object? videoUrl = freezed,
    Object? inherited = null,
    Object? inheritSourceWeek = freezed,
  }) {
    return _then(
      _$ExerciseWeekPlanImpl(
        week: null == week
            ? _value.week
            : week // ignore: cast_nullable_to_non_nullable
                  as int,
        sets: null == sets
            ? _value.sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: null == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as String,
        restSeconds: null == restSeconds
            ? _value.restSeconds
            : restSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
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
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        videoUrl: freezed == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        inherited: null == inherited
            ? _value.inherited
            : inherited // ignore: cast_nullable_to_non_nullable
                  as bool,
        inheritSourceWeek: freezed == inheritSourceWeek
            ? _value.inheritSourceWeek
            : inheritSourceWeek // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseWeekPlanImpl implements _ExerciseWeekPlan {
  const _$ExerciseWeekPlanImpl({
    required this.week,
    required this.sets,
    required this.reps,
    required this.restSeconds,
    this.tut,
    this.buf,
    this.intensity,
    this.note,
    this.videoUrl,
    this.inherited = false,
    this.inheritSourceWeek,
  });

  factory _$ExerciseWeekPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseWeekPlanImplFromJson(json);

  @override
  final int week;
  @override
  final int sets;
  @override
  final String reps;
  @override
  final int restSeconds;
  @override
  final String? tut;
  @override
  final int? buf;
  @override
  final String? intensity;
  @override
  final String? note;
  @override
  final String? videoUrl;
  @override
  @JsonKey()
  final bool inherited;
  @override
  final int? inheritSourceWeek;

  @override
  String toString() {
    return 'ExerciseWeekPlan(week: $week, sets: $sets, reps: $reps, restSeconds: $restSeconds, tut: $tut, buf: $buf, intensity: $intensity, note: $note, videoUrl: $videoUrl, inherited: $inherited, inheritSourceWeek: $inheritSourceWeek)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseWeekPlanImpl &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.restSeconds, restSeconds) ||
                other.restSeconds == restSeconds) &&
            (identical(other.tut, tut) || other.tut == tut) &&
            (identical(other.buf, buf) || other.buf == buf) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.inherited, inherited) ||
                other.inherited == inherited) &&
            (identical(other.inheritSourceWeek, inheritSourceWeek) ||
                other.inheritSourceWeek == inheritSourceWeek));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    week,
    sets,
    reps,
    restSeconds,
    tut,
    buf,
    intensity,
    note,
    videoUrl,
    inherited,
    inheritSourceWeek,
  );

  /// Create a copy of ExerciseWeekPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseWeekPlanImplCopyWith<_$ExerciseWeekPlanImpl> get copyWith =>
      __$$ExerciseWeekPlanImplCopyWithImpl<_$ExerciseWeekPlanImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseWeekPlanImplToJson(this);
  }
}

abstract class _ExerciseWeekPlan implements ExerciseWeekPlan {
  const factory _ExerciseWeekPlan({
    required final int week,
    required final int sets,
    required final String reps,
    required final int restSeconds,
    final String? tut,
    final int? buf,
    final String? intensity,
    final String? note,
    final String? videoUrl,
    final bool inherited,
    final int? inheritSourceWeek,
  }) = _$ExerciseWeekPlanImpl;

  factory _ExerciseWeekPlan.fromJson(Map<String, dynamic> json) =
      _$ExerciseWeekPlanImpl.fromJson;

  @override
  int get week;
  @override
  int get sets;
  @override
  String get reps;
  @override
  int get restSeconds;
  @override
  String? get tut;
  @override
  int? get buf;
  @override
  String? get intensity;
  @override
  String? get note;
  @override
  String? get videoUrl;
  @override
  bool get inherited;
  @override
  int? get inheritSourceWeek;

  /// Create a copy of ExerciseWeekPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseWeekPlanImplCopyWith<_$ExerciseWeekPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
