import 'package:equatable/equatable.dart';

import '../../../core/models/workout_session.dart';

class ActiveSessionState extends Equatable {
  const ActiveSessionState({
    required this.session,
    required this.exerciseIndex,
    this.isResting = false,
    this.restSecondsRemaining,
    this.isRestPaused = false,
  });

  final WorkoutSession session;
  final int exerciseIndex;
  final bool isResting;
  final int? restSecondsRemaining;
  final bool isRestPaused;

  ExerciseSession get currentExercise => session.exercises[exerciseIndex];

  ActiveSessionState copyWith({
    WorkoutSession? session,
    int? exerciseIndex,
    bool? isResting,
    int? restSecondsRemaining,
    bool? isRestPaused,
  }) {
    return ActiveSessionState(
      session: session ?? this.session,
      exerciseIndex: exerciseIndex ?? this.exerciseIndex,
      isResting: isResting ?? this.isResting,
      restSecondsRemaining: restSecondsRemaining,
      isRestPaused: isRestPaused ?? this.isRestPaused,
    );
  }

  @override
  List<Object?> get props => [
    session,
    exerciseIndex,
    isResting,
    restSecondsRemaining,
    isRestPaused,
  ];
}
