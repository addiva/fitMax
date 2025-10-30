import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxes {
  static const programs = 'programs';
  static const sessions = 'sessions';
  static const preferences = 'preferences';

  static Future<void> init() async {
    await Hive.openBox<String>(programs);
    await Hive.openBox<String>(sessions);
    await Hive.openBox<String>(preferences);
  }
}
