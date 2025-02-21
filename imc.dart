void main() {
  print(_imc(peso: 100, altura: 1.65));
}

String _imc({required double peso, required double altura}) {
  String classificacaoImc = '';
  final imc = peso / (altura * altura);  

  if (imc < 18.5) {
    classificacaoImc = 'Magreza';    
  } else if (imc <= 24.9) {
    classificacaoImc = 'Normal';
  } else if (imc <= 29.9) {
    classificacaoImc = 'Sobrepeso'; 
  } else if (imc <= 34.9) {
    classificacaoImc = 'Obesidade grau I'; 
  } else if (imc <= 39.9) {
    classificacaoImc = 'Obesidade grau II';
  } else {
    classificacaoImc = 'Obesidade grau III';
  }

  return 'Seu IMC é de: ${imc.toStringAsFixed(2)}, classificado como: $classificacaoImc' ;
}