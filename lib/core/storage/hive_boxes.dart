import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxes {
  static const programs = 'programs';
  static const sessions = 'sessions';
  static const preferences = 'preferences';

  static Future<void> init() async {
    await _openBoxWithRetry<String>(programs);
    await _openBoxWithRetry<String>(sessions);
    await _openBoxWithRetry<String>(preferences);
  }

  static Future<void> _openBoxWithRetry<T>(String name) async {
    const maxAttempts = 12;
    const baseDelay = Duration(milliseconds: 150);

    for (var attempt = 0; attempt < maxAttempts; attempt += 1) {
      try {
        if (Hive.isBoxOpen(name)) {
          return;
        }
        await Hive.openBox<T>(name);
        return;
      } on FileSystemException catch (error) {
        final code = error.osError?.errorCode;
        final isLockError = code == 35; // Resource temporarily unavailable
        final isLastAttempt = attempt == maxAttempts - 1;
        if (!isLockError || isLastAttempt) {
          rethrow;
        }
        final delay = baseDelay * (attempt + 1);
        debugPrint(
          '[HiveBoxes] Lock on "$name" (attempt ${attempt + 1}/$maxAttempts). '
          'Retrying in ${delay.inMilliseconds}ms...',
        );
        await Future.delayed(delay);
      }
    }
  }
}
