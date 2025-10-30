import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:vibration/vibration.dart';

import '../../../core/models/training_program.dart';
import '../../../core/models/workout_session.dart';
import '../../../core/providers/rest_notification_service_provider.dart';
import '../../../core/providers/session_repository_provider.dart';
import '../../../core/repositories/session_repository.dart';
import '../../../core/services/rest_notification_service.dart';
import 'active_session_state.dart';

final activeSessionProvider =
    NotifierProvider<ActiveSessionController, ActiveSessionState?>(
      ActiveSessionController.new,
    );

class ActiveSessionController extends Notifier<ActiveSessionState?> {
  RestNotificationService get _notifications =>
      ref.read(restNotificationServiceProvider);

  Timer? _restTimer;
  DateTime? _restStartTime;
  int _restInitialSeconds = 0;
  int? _restRemainingSeconds;
  bool _restPaused = false;

  SessionRepository get _sessionRepository =>
      ref.read(sessionRepositoryProvider);

  @override
  ActiveSessionState? build() {
    ref.onDispose(() {
      _restTimer?.cancel();
      _notifications.cancel();
    });
    return null;
  }

  Future<void> startSession({
    required WorkoutProgram program,
    required int week,
  }) async {
    final now = DateTime.now();
    final previousSession = await _sessionRepository.lastSessionForProgram(
      program.id,
    );
    final exercises = program.exercises.map((exercise) {
      final plan =
          exercise.weeks.firstWhereOrNull((w) => w.week == week) ??
          exercise.weeks.last;
      final previousExercise = previousSession?.exercises.firstWhereOrNull(
        (item) => item.exerciseId == exercise.id,
      );
      final sets = _buildSets(plan.sets, previousExercise);
      return ExerciseSession(
        exerciseId: exercise.id,
        exerciseName: exercise.name,
        restSecondsTarget: plan.restSeconds,
        tut: plan.tut,
        buf: plan.buf,
        intensity: plan.intensity,
        videoUrl: exercise.videoUrl ?? plan.videoUrl,
        repsTarget: plan.reps,
        note: plan.note,
        category: exercise.category,
        sets: sets,
      );
    }).toList();

    final session = WorkoutSession(
      id: const Uuid().v4(),
      programId: program.id,
      programName: program.name,
      week: week,
      startedAt: now,
      exercises: exercises,
    );

    _resetRestState();
    state = ActiveSessionState(session: session, exerciseIndex: 0);
  }

  void cancelSession() {
    _restTimer?.cancel();
    _notifications.cancel();
    state = null;
  }

  void selectExercise(int index) {
    final current = state;
    if (current == null) return;
    final clamped = index.clamp(0, current.session.exercises.length - 1);
    state = current.copyWith(
      exerciseIndex: clamped,
      isResting: false,
      restSecondsRemaining: null,
      isRestPaused: false,
    );
    _resetRestState();
  }

  void nextExercise() {
    final current = state;
    if (current == null) return;
    selectExercise(current.exerciseIndex + 1);
  }

  void previousExercise() {
    final current = state;
    if (current == null) return;
    selectExercise(current.exerciseIndex - 1);
  }

  void updateSet({
    required int exerciseIndex,
    required int setIndex,
    int? reps,
    double? weight,
  }) {
    final current = state;
    if (current == null) return;
    final exercises = [...current.session.exercises];
    final exercise = exercises[exerciseIndex];
    final sets = [...exercise.sets];
    final targetIndex = setIndex.clamp(0, sets.length - 1);
    final currentSet = sets[targetIndex];
    sets[targetIndex] = currentSet.copyWith(
      reps: reps ?? currentSet.reps,
      weight: weight ?? currentSet.weight,
    );
    exercises[exerciseIndex] = exercise.copyWith(sets: sets);
    state = current.copyWith(
      session: current.session.copyWith(exercises: exercises),
    );
  }

  void deleteExercise(int exerciseIndex) {
    final current = state;
    if (current == null) return;
    final exercises = [...current.session.exercises];
    if (exerciseIndex < 0 || exerciseIndex >= exercises.length) {
      return;
    }
    exercises.removeAt(exerciseIndex);
    final newIndex = min(exerciseIndex, max(0, exercises.length - 1));
    state = current.copyWith(
      session: current.session.copyWith(exercises: exercises),
      exerciseIndex: exercises.isEmpty ? 0 : newIndex,
    );
    _resetRestState();
  }

  void startRest([int? seconds]) {
    final current = state;
    if (current == null) return;
    _restTimer?.cancel();
    final exercise = current.currentExercise;
    var remaining = seconds ?? exercise.restSecondsTarget ?? 0;
    if (remaining <= 0) {
      remaining = 60;
    }

    _restInitialSeconds = remaining;
    _restRemainingSeconds = remaining;
    _restStartTime = DateTime.now();
    _restPaused = false;
    state = current.copyWith(
      isResting: true,
      restSecondsRemaining: remaining,
      isRestPaused: false,
    );
    _pushCountdown(remaining, paused: false);
    _startRestTicker();
  }

  void stopRest() {
    final current = state;
    if (current == null) return;
    _resetRestState();
    state = current.copyWith(
      isResting: false,
      restSecondsRemaining: null,
      isRestPaused: false,
    );
  }

  void pauseRest() {
    if (_restTimer == null || _restPaused) {
      return;
    }
    final current = state;
    if (current == null) return;
    final remaining = _computeRemainingSeconds();
    _restTimer?.cancel();
    _restTimer = null;
    _restRemainingSeconds = remaining;
    _restStartTime = null;
    _restPaused = true;
    state = current.copyWith(
      isResting: true,
      restSecondsRemaining: remaining,
      isRestPaused: true,
    );
    _pushCountdown(remaining, paused: true);
  }

  void resumeRest() {
    if (!_restPaused) {
      return;
    }
    final current = state;
    if (current == null) return;
    final remaining = _restRemainingSeconds ?? 0;
    if (remaining <= 0) {
      stopRest();
      return;
    }
    _restInitialSeconds = remaining;
    _restStartTime = DateTime.now();
    _restPaused = false;
    state = current.copyWith(
      isResting: true,
      restSecondsRemaining: remaining,
      isRestPaused: false,
    );
    _pushCountdown(remaining, paused: false);
    _startRestTicker();
  }

  Future<void> finishSession({String? notes}) async {
    final current = state;
    if (current == null) return;
    final completed = current.session.copyWith(
      completedAt: DateTime.now(),
      notes: notes,
    );
    await _sessionRepository.upsertSession(completed);
    _resetRestState();
    state = null;
  }

  List<SetLog> _buildSets(int count, ExerciseSession? previous) {
    final previousSets = previous?.sets ?? const [];
    return List.generate(count, (index) {
      final prev = index < previousSets.length ? previousSets[index] : null;
      return SetLog(index: index + 1, reps: prev?.reps, weight: prev?.weight);
    });
  }

  Future<void> _notifyRestComplete() async {
    try {
      final canVibrate = await Vibration.hasVibrator();
      if (canVibrate) {
        Vibration.vibrate(duration: 500);
      }
    } catch (_) {}
    SystemSound.play(SystemSoundType.alert);
    _notifications.cancel();
  }

  void _startRestTicker() {
    _restTimer?.cancel();
    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final current = state;
      if (current == null) {
        timer.cancel();
        return;
      }
      if (_restPaused) {
        timer.cancel();
        return;
      }
      final remaining = _computeRemainingSeconds();
      final updated = current.copyWith(
        isResting: true,
        restSecondsRemaining: remaining,
        isRestPaused: false,
      );
      state = updated;
      _pushCountdown(remaining, paused: false);
      if (remaining <= 0) {
        timer.cancel();
        _resetRestState();
        state = updated.copyWith(
          isResting: false,
          restSecondsRemaining: null,
          isRestPaused: false,
        );
        _notifyRestComplete();
      }
    });
  }

  int _computeRemainingSeconds() {
    if (_restPaused) {
      return _restRemainingSeconds ?? 0;
    }
    if (_restStartTime == null) {
      return _restRemainingSeconds ?? 0;
    }
    final elapsed = DateTime.now().difference(_restStartTime!).inSeconds;
    final remaining = max(0, _restInitialSeconds - elapsed);
    _restRemainingSeconds = remaining;
    return remaining;
  }

  void _resetRestState() {
    _restTimer?.cancel();
    _restTimer = null;
    _restStartTime = null;
    _restRemainingSeconds = null;
    _restInitialSeconds = 0;
    _restPaused = false;
    _notifications.cancel();
  }

  void _pushCountdown(int seconds, {required bool paused}) {
    final current = state;
    if (current == null) {
      return;
    }
    _notifications.updateCountdown(
      seconds,
      paused: paused,
      sessionName: current.session.programName,
      exerciseIndex: current.exerciseIndex,
      totalExercises: current.session.exercises.length,
      exerciseName: current.currentExercise.exerciseName,
    );
  }
}
