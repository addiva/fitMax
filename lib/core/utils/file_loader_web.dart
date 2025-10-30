import 'dart:convert';

import 'package:file_picker/file_picker.dart';

Future<String> loadPlatformFileContent(PlatformFile file) async {
  final bytes = file.bytes;
  if (bytes == null) {
    throw StateError('Unable to read file content in web environment');
  }
  return utf8.decode(bytes);
}
