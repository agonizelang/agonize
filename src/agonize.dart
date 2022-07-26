import 'dart:io';
import 'core/lexer.dart';
import 'core/parser.dart';
import 'interpreter.dart';

void raise(String error) {
  print('\x1b[31m$error\x1b[0m');
  exit(1);
}

String? readInputSync() {
  final List<int> input = [];
  while (true) {
    int byte = stdin.readByteSync();
    if (byte < 0) {
      if (input.isEmpty) {
        return null;
      }
      break;
    }
    input.add(byte);
  }
  return systemEncoding.decode(input);
}

Future<void> main(List<String> arguments) async {
  var path = '';
  if (arguments.isEmpty) {
    path = '-';
  } else if (arguments.length > 1) {
    raise('unrecognized arguments: ${arguments.sublist(1)}');
  } else {
    path = arguments[0].trim();
  }
  var data = '';
  if (path == '-') {
    try {
      data = readInputSync()!;
    } on FormatException {
      raise('expected utf-8 encoded bytes as code');
    } catch (err) {
      raise('exception occured while reading code: $err');
    }
  } else {
    final file = File(path);
    if (!await file.exists()) {
      raise('file not found: $path');
    }
    try {
      data = file.readAsStringSync().trim();
    } on OutOfMemoryError {
      raise('file too large: $path');
    } on FileSystemException {
      raise('file system read operation on $path failed');
    } catch (err) {
      raise('exception occured while reading code: $err');
    }
  }
  if (stdin.hasTerminal) {
    stdin.echoMode = false;
    stdin.lineMode = false;
  }
  final lexer = Lexer(code: data);
  final tokens = lexer.tokenize();
  final parser = Parser(tokens: tokens);
  final elements = parser.parse();
  final interpreter = Interpreter(elements: elements);
  interpreter.execute();
}
