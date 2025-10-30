import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/rest_notification_service.dart';

/// A provider that exposes a stream of notification tap events.
final notificationTapStreamProvider = StreamProvider<void>((ref) {
  final service = RestNotificationService.instance;
  return service.tapStream;
});
