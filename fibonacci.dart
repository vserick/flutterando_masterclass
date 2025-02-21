void main() {
  print(_geraFibonacci(11));
}

List<int> _geraFibonacci(int quantidade) {
  List<int> fibonacci = [];
  for (var i = 1; i <= quantidade; i++) {
    int proximo = 1;
    if (i >= 3) {
      proximo = fibonacci[i - 2] + fibonacci[i - 3];  
    }         

    fibonacci.add(proximo);
  }

  return fibonacci;
}

// 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...