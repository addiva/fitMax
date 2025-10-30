/// Strips comments from a JSON string.
String stripJsonComments(String input) {
  final buffer = StringBuffer();
  var i = 0;
  var inString = false;
  var escape = false;

  while (i < input.length) {
    final char = input[i];

    if (inString) {
      buffer.write(char);
      if (escape) {
        escape = false;
      } else if (char == '\\') {
        escape = true;
      } else if (char == '"') {
        inString = false;
      }
      i++;
      continue;
    }

    if (char == '"') {
      inString = true;
      buffer.write(char);
      i++;
      continue;
    }

    if (char == '/' && i + 1 < input.length) {
      final next = input[i + 1];
      if (next == '/') {
        i += 2;
        while (i < input.length && input[i] != '\n' && input[i] != '\r') {
          i++;
        }
        continue;
      } else if (next == '*') {
        i += 2;
        while (i + 1 < input.length &&
            !(input[i] == '*' && input[i + 1] == '/')) {
          i++;
        }
        i += 2;
        continue;
      }
    }

    buffer.write(char);
    i++;
  }

  return buffer.toString();
}
