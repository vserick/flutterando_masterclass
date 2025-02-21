void main() {
  print(_validaCartao('5195 8235 2094 8851'));
}

String _validaCartao(String numCartao) {
  numCartao = numCartao.replaceAll(' ', '');

  if (numCartao.contains(RegExp(r'[A-Z]', caseSensitive: false))) {
    return 'Cartão inválido';
  }

  final digito = numCartao.substring(numCartao.length - 1, numCartao.length);
  final numSemDig = numCartao.substring(0, numCartao.length - 1);  

  if (_digito(numSemDig) != int.parse(digito)) {
    return 'Cartão inválido';
  }

  return 'Cartão válido';
}

int _digito(String numeroAdaptado) {
  List<int> colunasMultiplicadas = [];
  for (var i = 0; i < numeroAdaptado.length; i++) {
    int multColuna;
    if (i % 2 == 0) {
      multColuna = int.parse(numeroAdaptado.substring(i, i + 1)) * 2;
    } else {
      multColuna = int.parse(numeroAdaptado.substring(i, i + 1));
    }    

    if (multColuna >= 10) {
      multColuna = int.parse(multColuna.toString().substring(0, 1)) +
          int.parse(multColuna.toString().substring(1, 2));
    }

    colunasMultiplicadas.add(multColuna);
  }

  final total =
      colunasMultiplicadas.fold(0, (previous, element) => previous + element);

  return 10 - (total % 10);
}
