// Cifra Vigenère
// Embaralha textos
// Somente letras são transformadas

// Criar classe que:
// Tenha uma key (chave)
// Faz encode (criptografa)
// Faz decode (descriptografa)

const BASE_RANDOM = 'FLUTTERANDOMASTERCLASS';
void main() {
  final crip = Criptografa(text: 'Ab,CD');
  print(crip.encode() == 'FM,VW');

  final crip2 = Criptografa(text: 'FM,VW');
  print(crip2.decode() == 'AB,CD');
}

class Criptografa {
  Criptografa({
    required this.text,
  }) {
    _textUpper = text.toUpperCase();
    _key = _generateKey();
  }

  final String text;
  late String _textUpper;
  late String _key;

  /// Gera a key.
  String _generateKey() {
    String base = _generateBase();

    if (base.length > _textUpper.length) {
      base = base.substring(0, _textUpper.length);
    }

    return base;
  }

  /// Gera uma base randomica a partir da base constante [BASE_RANDOM].
  String _generateBase() {
    final integer = _textUpper.length ~/ BASE_RANDOM.length;
    String newBase = BASE_RANDOM;

    for (var i = 0; i < integer; i++) {
      newBase = newBase + newBase;
    }

    return newBase;
  }

  /// Criptografa o [text] do objeto utilizando a Cifra Viginère.
  String encode() {
    String newChar = '';
    for (var i = 0; i < _textUpper.length; i++) {
      final charKey = _key.substring(i, i + 1);
      final charText = _textUpper.substring(i, i + 1);

      if (_isLetter(charText)) {
        final soma = charKey.codeUnitAt(0) + charText.codeUnitAt(0);
        final res = soma % 26;
        final codeChar = res + 'A'.codeUnitAt(0);
        newChar = newChar + String.fromCharCode(codeChar);
      } else {
        newChar = newChar + charText;
      }
    }

    return newChar;
  }

  /// Descriptografa o [text] do objeto utilizando a Cifra Viginère.
  String decode() {
    String newChar = '';
    for (var i = 0; i < _textUpper.length; i++) {
      final charKey = _key.substring(i, i + 1);
      final charText = _textUpper.substring(i, i + 1);

      if (_isLetter(charText)) {
        final soma = (charText.codeUnitAt(0) - charKey.codeUnitAt(0)) + 26;
        final res = soma % 26;
        final codeChar = res + 'A'.codeUnitAt(0);
        newChar = newChar + String.fromCharCode(codeChar);
      } else {
        newChar = newChar + charText;
      }
    }

    return newChar;
  }

  bool _isLetter(String char) {
    return RegExp(r'^[a-zA-Z]$').hasMatch(char);
  }
}
