import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/rest_notification_service.dart';

final restNotificationServiceProvider = Provider<RestNotificationService>((ref) {
  return RestNotificationService.instance;
});
