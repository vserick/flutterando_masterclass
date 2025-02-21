const List<int> SEQ_MULTIPLICADORA_DIG1 = [10, 9, 8, 7, 6, 5, 4, 3, 2];
const List<int> SEQ_MULTIPLICADORA_DIG2 = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2];

void main() {
  print(_validaCpf('988.249.890-19'));
}

String _validaCpf(String cpf) {
  cpf = cpf.replaceAll('.', '').replaceAll('-', '');

  if (cpf.contains(RegExp(r'[A-Z]', caseSensitive: false))) {
    return 'CPF inválido';
  }

  final cpfSemDigitos = cpf.substring(0, cpf.length - 2);
  final primeiroDigito = cpf.substring(cpf.length - 2, cpf.length - 1);
  final segundoDigito = cpf.substring(cpf.length - 1, cpf.length);

  // Válida primeiro digito verificador do CPF
  if (_validaDigito(cpfSemDigitos, SEQ_MULTIPLICADORA_DIG1) != primeiroDigito) {
    return 'CPF inválido';
  }

  // Válida segundo digito verificador do CPF
  if (_validaDigito(cpfSemDigitos + primeiroDigito, SEQ_MULTIPLICADORA_DIG2) !=
      segundoDigito) {
    return 'CPF inválido';
  }

  return 'CPF válido';
}

String _validaDigito(String cpfAdaptado, List<int> sequencia) {
  int somaDigitos = 0;
  for (var i = 0; i < cpfAdaptado.length; i++) {
    somaDigitos = somaDigitos +
        (int.parse(cpfAdaptado.substring(i, i + 1)) * sequencia[i]);
  }

  final resto = somaDigitos % 11;

  if (resto < 2) {
    return '0';
  }

  return (11 - resto).toString();
}
