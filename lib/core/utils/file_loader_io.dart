import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

Future<String> loadPlatformFileContent(PlatformFile file) async {
  if (file.bytes != null) {
    return utf8.decode(file.bytes!);
  }
  if (file.path != null) {
    final ioFile = File(file.path!);
    return ioFile.readAsString();
  }
  throw StateError('Unable to read file content');
}
