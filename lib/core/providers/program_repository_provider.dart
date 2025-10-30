import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/program_repository.dart';

/// A provider that exposes the [ProgramRepository] to the app.
final programRepositoryProvider = Provider<ProgramRepository>((ref) {
  return ProgramRepository();
});
