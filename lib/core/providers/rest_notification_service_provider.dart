import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/rest_notification_service.dart';

/// A provider that exposes the [RestNotificationService] to the app.
final restNotificationServiceProvider = Provider<RestNotificationService>((ref) {
  return RestNotificationService.instance;
});
