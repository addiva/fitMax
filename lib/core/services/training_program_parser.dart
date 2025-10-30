import 'dart:convert';

import 'package:collection/collection.dart';

import '../models/training_program.dart';
import '../utils/json_utils.dart';

class TrainingProgramParser {
  const TrainingProgramParser();

  WorkoutProgram parseFromJsonString(String source) {
    final normalized = stripJsonComments(source);
    final decoded = jsonDecode(normalized) as Map<String, dynamic>;
    return parseFromMap(decoded);
  }

  WorkoutProgram parseFromMap(Map<String, dynamic> map) {
    final base = WorkoutProgram.fromJson(_normalizeProgramMap(map));

    final exercises = base.exercises
        .map(
          (exercise) => exercise.copyWith(
            id: exercise.id.isNotEmpty ? exercise.id : _slugify(exercise.name),
            weeks: _resolveWeeks(
              exercise.progression,
              base.weeks.total,
              exercise.videoUrl,
            ),
          ),
        )
        .toList();

    return base.copyWith(exercises: exercises);
  }

  Map<String, dynamic> _normalizeProgramMap(Map<String, dynamic> input) {
    final exercises = (input['exercises'] as List?) ?? const [];
    return {
      'id': (input['id'] as String?)?.trim().isNotEmpty == true
          ? input['id']
          : _slugify(input['name'] as String? ?? 'program'),
      'name': input['name'] ?? 'Program',
      'note': input['note'],
      'tags': (input['tags'] as List?)?.cast<String>() ?? const <String>[],
      'weeks': _normalizeWeeks(input['weeks'] as Map<String, dynamic>?),
      'createdAt': input['createdAt'],
      'updatedAt': input['updatedAt'],
      'exercises': exercises.map((raw) => _normalizeExercise(raw)).toList(),
    };
  }

  Map<String, dynamic> _normalizeWeeks(Map<String, dynamic>? raw) {
    if (raw == null) {
      return {'total': 4};
    }
    final total = raw['total'] ?? raw['weeks'] ?? 4;
    return {
      'total': total is num ? total.toInt() : int.tryParse('$total') ?? 4,
      'deload': raw['deload'] == null
          ? null
          : (raw['deload'] is num
                ? (raw['deload'] as num).toInt()
                : int.tryParse('${raw['deload']}')),
    };
  }

  Map<String, dynamic> _normalizeExercise(dynamic raw) {
    if (raw is! Map<String, dynamic>) {
      return {'id': _slugify('$raw'), 'name': '$raw', 'progression': const []};
    }

    final progression = (raw['progression'] as List?) ?? const [];

    return {
      'id': (raw['id'] as String?) ?? '',
      'name': raw['name'] ?? 'Exercise',
      'category': raw['category'],
      'note': raw['note'],
      'videoUrl': raw['video_url'] ?? raw['videoUrl'],
      'progression': progression
          .map((entry) => _normalizeProgression(entry))
          .toList(),
    };
  }

  Map<String, dynamic> _normalizeProgression(dynamic raw) {
    if (raw is! Map<String, dynamic>) {
      return {};
    }

    Map<String, dynamic> map = Map<String, dynamic>.from(raw);
    int? takeInt(String key) {
      final value = map.remove(key);
      return _parseInt(value);
    }

    final restSeconds = takeInt('rest_sec') ?? takeInt('rest');
    if (restSeconds != null) {
      map['restSeconds'] = restSeconds;
    }
    final sets = takeInt('sets');
    if (sets != null) {
      map['sets'] = sets;
    }
    final buf = takeInt('buf');
    if (buf != null) {
      map['buf'] = buf;
    }
    final setDelta = takeInt('set_delta');
    if (setDelta != null) {
      map['setDelta'] = setDelta;
    }
    final restDelta = takeInt('rest_delta');
    if (restDelta != null) {
      map['restDelta'] = restDelta;
    }
    final bufDelta = takeInt('buf_delta');
    if (bufDelta != null) {
      map['bufDelta'] = bufDelta;
    }
    final inherit = takeInt('inherit');
    if (inherit != null) {
      map['inherit'] = inherit;
    }
    final weekOffset = takeInt('weekOffset');
    if (weekOffset != null) {
      map['weekOffset'] = weekOffset;
    }
    final videoUrl = map.remove('video_url');
    if (videoUrl != null) {
      map['videoUrl'] = videoUrl;
    }
    return map;
  }

  List<ExerciseWeekPlan> _resolveWeeks(
    List<ExerciseProgressionStep> steps,
    int totalWeeks,
    String? fallbackVideo,
  ) {
    final plans = <ExerciseWeekPlan>[];

    ExerciseWeekPlan fallback(int week) {
      if (plans.isEmpty) {
        throw StateError(
          'Cannot inherit progression before defining a base week.',
        );
      }
      final base = plans.last;
      return base.copyWith(
        week: week,
        inherited: true,
        inheritSourceWeek: base.inheritSourceWeek ?? base.week,
      );
    }

    for (var i = 0; i < totalWeeks; i++) {
      final currentWeek = i + 1;
      final step = i < steps.length ? steps[i] : null;

      if (step == null) {
        plans.add(fallback(currentWeek));
        continue;
      }

      if (step.inherit != null) {
        final inheritWeek = step.inherit!.clamp(1, totalWeeks);
        final source =
            plans.firstWhereOrNull((plan) => plan.week == inheritWeek) ??
            (plans.isEmpty ? null : plans.last);

        if (source == null) {
          throw StateError(
            'Week $currentWeek cannot inherit from week $inheritWeek before it is defined.',
          );
        }

        final plan = source.copyWith(
          week: currentWeek,
          sets: (step.sets ?? source.sets) + (step.setDelta ?? 0),
          restSeconds:
              (step.restSeconds ?? source.restSeconds) + (step.restDelta ?? 0),
          buf: (step.buf ?? source.buf) == null
              ? null
              : (step.buf ?? source.buf)! + (step.bufDelta ?? 0),
          reps: step.reps ?? source.reps,
          tut: step.tut ?? source.tut,
          intensity: step.intensity ?? source.intensity,
          note: step.note ?? source.note,
          videoUrl: step.videoUrl ?? source.videoUrl ?? fallbackVideo,
          inherited: true,
          inheritSourceWeek: inheritWeek,
        );
        plans.add(plan);
        continue;
      }

      final baseSets = step.sets ?? (plans.isNotEmpty ? plans.last.sets : 0);
      final baseRest =
          step.restSeconds ?? (plans.isNotEmpty ? plans.last.restSeconds : 90);
      final baseBuf = step.buf ?? (plans.isNotEmpty ? plans.last.buf : null);
      final plan = ExerciseWeekPlan(
        week: currentWeek,
        sets: baseSets,
        reps: step.reps ?? (plans.isNotEmpty ? plans.last.reps : '10'),
        restSeconds: baseRest,
        tut: step.tut ?? (plans.isNotEmpty ? plans.last.tut : null),
        buf: baseBuf,
        intensity:
            step.intensity ?? (plans.isNotEmpty ? plans.last.intensity : null),
        note: step.note ?? (plans.isNotEmpty ? plans.last.note : null),
        videoUrl: step.videoUrl ?? fallbackVideo,
        inherited: false,
        inheritSourceWeek: null,
      );
      plans.add(plan);
    }

    return plans;
  }

  int? _parseInt(Object? value) {
    if (value == null) {
      return null;
    }
    if (value is num) {
      return value.toInt();
    }
    return int.tryParse(value.toString());
  }

  String _slugify(String input) {
    final lower = input.trim().toLowerCase();
    final buffer = StringBuffer();
    var lastWasDash = false;
    for (final rune in lower.runes) {
      final char = String.fromCharCode(rune);
      final isLetterOrDigit = RegExp(r'[a-z0-9]').hasMatch(char);
      if (isLetterOrDigit) {
        buffer.write(char);
        lastWasDash = false;
      } else if (!lastWasDash) {
        buffer.write('-');
        lastWasDash = true;
      }
    }
    final output = buffer.toString().replaceAll(RegExp('-+'), '-');
    final trimmed = output.trim().replaceAll(RegExp(r'^-|-$'), '');
    return trimmed.isEmpty ? 'item' : trimmed;
  }
}
