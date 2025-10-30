import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// A class that manages the Hive boxes.
class HiveBoxes {
  /// The name of the programs box.
  static const programs = 'programs';

  /// The name of the sessions box.
  static const sessions = 'sessions';

  /// The name of the preferences box.
  static const preferences = 'preferences';

  /// Initializes the Hive boxes.
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
