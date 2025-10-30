import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/program_repository.dart';

final programRepositoryProvider = Provider<ProgramRepository>((ref) {
  return ProgramRepository();
});
