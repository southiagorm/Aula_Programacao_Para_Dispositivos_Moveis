import 'dart:io';

main() {
  List<String> nomes = new List();

  for (var i = 0; i < 2; i++) {
    print("Digite um Nome: ");
    nomes.add(stdin.readLineSync());
  }
  print("-------------------");
  nomes.forEach((element) {
    print(element);
  });
}
