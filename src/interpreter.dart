import 'dart:convert';
import 'dart:io';
import 'agonize.dart';
import 'core/parser.dart';

class Interpreter {
  final List elements;
  int point = 0;
  Interpreter({required this.elements});

  Future<void> execute() async {
    for (final element in elements) {
      if (element is Loop) {
        for (var i = 0; i < element.count; i++) {
          for (final operation in element.operations) {
            await performNormalOperation(operation);
          }
        }
      } else {
        await performNormalOperation(element);
      }
    }
  }

  Future<void> performNormalOperation(element) async {
    if (element is Operation) {
      if (element.type == Ops.increment) {
        point++;
        if (point == 0x110000) {
          point = 0;
        }
      } else {
        point--;
        if (point == -1) {
          point += 0x110000;
        }
      }
    } else if (element is Io) {
      if (element.type == IoOps.input) {
        if (stdin.hasTerminal) {
          point += (await stdin.transform(utf8.decoder).first).codeUnitAt(0);
        } else {
          raise('cannot read from stdin when reading code from stdin');
        }
      } else {
        stdout.write(String.fromCharCode(point));
        await stdout.flush();
      }
    }
  }
}
