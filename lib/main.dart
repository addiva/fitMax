import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'core/services/rest_notification_service.dart';
import 'core/storage/hive_boxes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveBoxes.init();
  await RestNotificationService.instance.initialize();

  runApp(const ProviderScope(child: FitmaxApp()));
}
