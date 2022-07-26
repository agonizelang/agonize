import '../agonize.dart';
import 'lexer.dart';

const ops = [
  '-',
  '+',
];
const io = [
  '<',
  '>',
];
const loop = [
  '[',
  ']',
];
const multiplier = '*';
enum Ops {
  decrement,
  increment,
}
enum IoOps {
  output,
  input,
}

class Operation {
  final Ops type;
  Operation({
    required this.type,
  });
}

class Loop {
  final List operations;
  final int count;
  Loop({
    required this.operations,
    required this.count,
  });
}

class Io {
  final IoOps type;
  Io({
    required this.type,
  });
}

class Parser {
  final List<Token> tokens;
  Parser({
    required this.tokens,
  });

  List parse() {
    final elements = [];
    var inLoop = false;
    List expecting = [null, true];
    var loopElements = [];
    var loopCount = 0;

    for (final token in tokens) {
      if (token.type == Types.op) {
        if (expecting[0] == null) {
          if (ops.contains(token.string)) {
            (inLoop ? loopElements : elements).add(
              Operation(
                type: token.string == ops[0] ? Ops.decrement : Ops.increment,
              ),
            );
          } else if (io.contains(token.string)) {
            (inLoop ? loopElements : elements).add(
              Io(
                type: token.string == io[0] ? IoOps.input : IoOps.output,
              ),
            );
          } else if (token.string == multiplier) {
            raise('expected a loop before "$multiplier"');
          } else if (loop.contains(token.string)) {
            if (token.string == loop[0]) {
              if (inLoop) {
                raise('nested loops not allowed');
              } else {
                inLoop = true;
              }
            } else {
              if (inLoop) {
                inLoop = false;
                expecting = [multiplier, false];
              } else {
                raise('unexpected "${loop[1]}" with no open loop');
              }
            }
          }
        } else {
          if (expecting[1]) {
            if (token.string == multiplier) {
              loopCount++;
            } else {
              elements.add(
                Loop(
                  operations: loopElements,
                  count: loopCount,
                ),
              );
              loopElements = [];
              loopCount = 0;
              expecting = [null, true];
              if (ops.contains(token.string)) {
                elements.add(
                  Operation(
                    type:
                        token.string == ops[0] ? Ops.decrement : Ops.increment,
                  ),
                );
              } else if (io.contains(token.string)) {
                elements.add(
                  Io(
                    type: token.string == io[0] ? IoOps.input : IoOps.output,
                  ),
                );
              } else if (loop.contains(token.string)) {
                if (token.string == loop[0]) {
                  inLoop = true;
                } else {
                  raise('unexpected "${loop[1]}" with no open loop');
                }
              }
            }
          } else {
            if (token.string == multiplier) {
              loopCount++;
              expecting[1] = true;
            } else {
              raise('expected at least one "$multiplier" after loop');
            }
          }
        }
      }
    }
    return elements;
  }
}
