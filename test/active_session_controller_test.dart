import 'package:fitmax/core/models/training_program.dart';
import 'package:fitmax/core/models/workout_session.dart';
import 'package:fitmax/features/session/providers/active_session_controller.dart';
import 'package:fitmax/features/session/providers/active_session_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deleteExercise should correctly update the exerciseIndex', () {
    final container = ProviderContainer();
    final controller = container.read(activeSessionProvider.notifier);

    // Start a session with 3 exercises
    controller.state = ActiveSessionState(
      session: WorkoutSession(
        id: '1',
        programId: '1',
        programName: 'Test Program',
        week: 1,
        startedAt: DateTime.now(),
        exercises: [
          ExerciseSession(exerciseId: '1', exerciseName: 'Exercise 1', sets: [], restSecondsTarget: 60, tut: '', buf: '', intensity: '', repsTarget: '', note: '', category: '', videoUrl: ''),
          ExerciseSession(exerciseId: '2', exerciseName: 'Exercise 2', sets: [], restSecondsTarget: 60, tut: '', buf: '', intensity: '', repsTarget: '', note: '', category: '', videoUrl: ''),
          ExerciseSession(exerciseId: '3', exerciseName: 'Exercise 3', sets: [], restSecondsTarget: 60, tut: '', buf: '', intensity: '', repsTarget: '', note: '', category: '', videoUrl: ''),
        ],
      ),
      exerciseIndex: 0,
    );

    // Delete the last exercise
    controller.deleteExercise(2);

    // Verify the new state
    expect(controller.state?.session.exercises.length, 2);
    expect(controller.state?.exerciseIndex, 1);
  });
}