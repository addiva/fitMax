import 'dart:io';

Future<void> saveStringToFile(String path, String content) async {
  final file = File(path);
  await file.writeAsString(content);
}
