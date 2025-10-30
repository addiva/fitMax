import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../models/training_program.dart';
import '../services/training_program_parser.dart';
import '../storage/hive_boxes.dart';

class ProgramRepository {
  ProgramRepository({TrainingProgramParser? parser})
    : _parser = parser ?? const TrainingProgramParser(),
      _programBox = Hive.box<String>(HiveBoxes.programs),
      _preferencesBox = Hive.box<String>(HiveBoxes.preferences);

  final TrainingProgramParser _parser;
  final Box<String> _programBox;
  final Box<String> _preferencesBox;

  static const _initialAssets = [
    'assets/schede/scheda_A.json',
    'assets/schede/scheda_B.json',
    'assets/schede/scheda_C.json',
    'assets/schede/scheda_D.json',
  ];

  Future<void> ensureInitialProgramsImported() async {
    final flag = _preferencesBox.get('initial_programs_loaded');
    if (flag == 'true') {
      return;
    }
    for (final asset in _initialAssets) {
      try {
        final content = await rootBundle.loadString(asset);
        final program = _parser.parseFromJsonString(content);
        await upsertProgram(program.copyWith(createdAt: DateTime.now()));
      } catch (error, stackTrace) {
        debugPrint('Failed to load $asset: $error');
        debugPrint('$stackTrace');
      }
    }
    await _preferencesBox.put('initial_programs_loaded', 'true');
  }

  Future<List<WorkoutProgram>> loadPrograms() async {
    final items = <WorkoutProgram>[];
    for (final key in _programBox.keys) {
      final raw = _programBox.get(key);
      if (raw == null) {
        continue;
      }
      try {
        final decoded = jsonDecode(raw) as Map<String, dynamic>;
        final program = WorkoutProgram.fromJson(decoded);
        items.add(program);
      } catch (error, stackTrace) {
        debugPrint('Failed to decode program $key: $error');
        debugPrint('$stackTrace');
      }
    }
    items.sort((a, b) => a.name.compareTo(b.name));
    return items;
  }

  Stream<List<WorkoutProgram>> watchPrograms() async* {
    yield await loadPrograms();
    await for (final _ in _programBox.watch()) {
      yield await loadPrograms();
    }
  }

  Future<void> upsertProgram(WorkoutProgram program) async {
    final now = DateTime.now();
    final payload = program.copyWith(
      updatedAt: now,
      createdAt: program.createdAt ?? now,
    );
    await _programBox.put(payload.id, jsonEncode(payload.toJson()));
  }

  Future<void> deleteProgram(String programId) async {
    await _programBox.delete(programId);
  }

  Future<WorkoutProgram> importProgramFromUrl(Uri url) async {
    final response = await http.get(url);
    if (response.statusCode >= 400) {
      throw Exception('HTTP ${response.statusCode}: ${response.reasonPhrase}');
    }
    final program = _parser.parseFromJsonString(response.body);
    await upsertProgram(program);
    return program;
  }

  Future<WorkoutProgram> importProgramFromRawJson(String content) async {
    final program = _parser.parseFromJsonString(content);
    await upsertProgram(program);
    return program;
  }

  Future<WorkoutProgram?> getProgram(String id) async {
    final raw = _programBox.get(id);
    if (raw == null) {
      return null;
    }
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    return WorkoutProgram.fromJson(decoded);
  }

  Future<void> renameProgram({
    required String programId,
    required String newName,
  }) async {
    final program = await getProgram(programId);
    if (program == null) {
      return;
    }
    await upsertProgram(program.copyWith(name: newName));
  }
}
