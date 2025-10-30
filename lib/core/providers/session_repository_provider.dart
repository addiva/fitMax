import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/session_repository.dart';

final sessionRepositoryProvider = Provider<SessionRepository>((ref) {
  return SessionRepository();
});
