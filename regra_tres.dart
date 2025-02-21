void main() {
  final double valor1gp1 = 5;
  final double valor2gp1 = 6;

  final double valor1gp2 = 1.5;
  final double valor2gp2 =
      _valor2gp2(vl1gp1: valor1gp1, vl2gp1: valor2gp1, vl1gp2: valor1gp2);

  print(
      'O resultado do 2 número do grupo 2 é: ${valor2gp2.toStringAsFixed(2)}');
}

double _valor2gp2({
  required double vl1gp1,
  required double vl2gp1,
  required double vl1gp2,
}) {
  return (vl2gp1 * vl1gp2) / vl1gp1;
}
