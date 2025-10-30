import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/workout_session.dart';
import '../storage/hive_boxes.dart';

/// A repository for managing workout sessions.
class SessionRepository {
  /// Creates a new session repository.
  SessionRepository() : _box = Hive.box<String>(HiveBoxes.sessions);

  final Box<String> _box;

  /// Loads all sessions from the repository.
  Future<List<WorkoutSession>> loadSessions() async {
    final sessions = <WorkoutSession>[];
    for (final key in _box.keys) {
      final raw = _box.get(key);
      if (raw == null) continue;
      try {
        final decoded = jsonDecode(raw) as Map<String, dynamic>;
        sessions.add(WorkoutSession.fromJson(decoded));
      } catch (error, stackTrace) {
        debugPrint('Failed to decode session $key: $error');
        debugPrint('$stackTrace');
      }
    }
    sessions.sort((a, b) => b.startedAt.compareTo(a.startedAt));
    return sessions;
  }

  /// Watches all sessions in the repository for changes.
  Stream<List<WorkoutSession>> watchSessions() async* {
    yield await loadSessions();
    await for (final _ in _box.watch()) {
      yield await loadSessions();
    }
  }

  /// Inserts or updates a session in the repository.
  Future<void> upsertSession(WorkoutSession session) async {
    await _box.put(session.id, jsonEncode(session.toJson()));
  }

  /// Deletes a session from the repository.
  Future<void> deleteSession(String sessionId) async {
    await _box.delete(sessionId);
  }

  /// Gets a session from the repository by its ID.
  Future<WorkoutSession?> getSession(String id) async {
    final raw = _box.get(id);
    if (raw == null) return null;
    return WorkoutSession.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  /// Gets the last session for a given program.
  Future<WorkoutSession?> lastSessionForProgram(String programId) async {
    final sessions = await loadSessions();
    return sessions.firstWhereOrNull(
      (session) => session.programId == programId,
    );
  }

  /// Clears all sessions from the repository.
  Future<void> clear() async {
    await _box.clear();
  }

  /// Exports all sessions to a JSON string.
  Future<String> exportSessions() async {
    final sessions = await loadSessions();
    final payload = sessions.map((session) => session.toJson()).toList();
    return const JsonEncoder.withIndent('  ').convert(payload);
  }

  /// Imports sessions from a JSON string.
  Future<int> importSessions(String json) async {
    final decoded = jsonDecode(json);
    if (decoded is! List) {
      throw FormatException('Expected a JSON array');
    }
    var imported = 0;
    for (final entry in decoded) {
      if (entry is! Map<String, dynamic>) {
        continue;
      }
      try {
        final session = WorkoutSession.fromJson(entry);
        await upsertSession(session);
        imported++;
      } catch (error, stackTrace) {
        debugPrint('Failed to import session: $error');
        debugPrint('$stackTrace');
      }
    }
    return imported;
  }
}
