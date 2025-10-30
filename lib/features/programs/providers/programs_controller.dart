import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/training_program.dart';
import '../../../core/providers/program_repository_provider.dart';
import '../../../core/repositories/program_repository.dart';
import '../../../core/utils/file_loader.dart';

/// The provider for the [ProgramsController].
final programsControllerProvider =
    AsyncNotifierProvider.autoDispose<ProgramsController, void>(
      ProgramsController.new,
    );

/// A controller for managing programs.
class ProgramsController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    // Nothing to load upfront.
  }

  ProgramRepository get _repository => ref.read(programRepositoryProvider);

  /// Imports a program from a file.
  Future<WorkoutProgram?> importFromFile() async {
    try {
      state = const AsyncValue.loading();
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: const ['json'],
        withData: true,
      );
      if (result == null || result.files.isEmpty) {
        state = const AsyncValue.data(null);
        return null;
      }
      final file = result.files.single;
      final content = await _readFileContent(file);
      final program = await _repository.importProgramFromRawJson(content);
      state = const AsyncValue.data(null);
      return program;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  /// Imports a program from the clipboard.
  Future<WorkoutProgram?> importFromClipboard() async {
    try {
      state = const AsyncValue.loading();
      final clipboardData = await Clipboard.getData('text/plain');
      final content = clipboardData?.text;
      if (content == null || content.isEmpty) {
        state = const AsyncValue.data(null);
        return null;
      }
      final program = await _repository.importProgramFromRawJson(content);
      state = const AsyncValue.data(null);
      return program;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  /// Imports a program from a URL.
  Future<WorkoutProgram?> importFromUrl(String url) async {
    try {
      state = const AsyncValue.loading();
      final uri = Uri.parse(url);
      final program = await _repository.importProgramFromUrl(uri);
      state = const AsyncValue.data(null);
      return program;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  /// Deletes a program.
  Future<void> deleteProgram(String programId) async {
    try {
      state = const AsyncValue.loading();
      await _repository.deleteProgram(programId);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  /// Renames a program.
  Future<void> renameProgram({
    required String programId,
    required String newName,
  }) async {
    try {
      state = const AsyncValue.loading();
      await _repository.renameProgram(programId: programId, newName: newName);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  /// Exports a program to a JSON string.
  Future<String> exportProgram(String programId) async {
    final program = await _repository.getProgram(programId);
    if (program == null) {
      throw StateError('Program not found');
    }
    return const JsonEncoder.withIndent('  ').convert(program.toJson());
  }

  Future<String> _readFileContent(PlatformFile file) =>
      loadPlatformFileContent(file);
}
