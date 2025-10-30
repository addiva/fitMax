import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/session_repository.dart';

/// A provider that exposes the [SessionRepository] to the app.
final sessionRepositoryProvider = Provider<SessionRepository>((ref) {
  return SessionRepository();
});
