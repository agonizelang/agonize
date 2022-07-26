const ops = [
  '+',
  '-',
  '[',
  ']',
  '*',
  '>',
  '<',
];
enum Types {
  op,
  comment,
}

class Token {
  final Types type;
  final String string;
  Token({
    required this.type,
    required this.string,
  });
}

class Lexer {
  final String code;
  Lexer({
    required this.code,
  });

  List<Token> tokenize() {
    final List<Token> tokens = [];
    for (final charCode in code.codeUnits) {
      final char = String.fromCharCode(charCode);
      if (ops.contains(char)) {
        tokens.add(
          Token(
            type: Types.op,
            string: char,
          ),
        );
      } else {
        tokens.add(
          Token(
            type: Types.comment,
            string: char,
          ),
        );
      }
    }
    return tokens;
  }
}
