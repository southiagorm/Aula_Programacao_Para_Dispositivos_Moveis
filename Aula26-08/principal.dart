import 'dart:convert';
import 'dart:io';

main() {
  var nome = "João";
  String matricula;
  double nota1, nota2;

  print("Informe o seu nome: ");
  nome = stdin.readLineSync();
  print("Informe a sua Matricula: ");
  matricula = stdin.readLineSync();
  print("Digite a primeira nota: ");
  nota1 = double.parse(stdin.readLineSync());
  print("Digite a segunda nota: ");
  nota2 = double.parse(stdin.readLineSync());

  var media = calcularMedia(nota1, nota2);

  verificarAprovacao(media, nome: nome);

  //String valor =
  //media >= 7 ? "Aprovado" : media >= 4 ? "Recuperação" : "Reprovado";
}

calcularMedia(double nota1, double nota2) {
  return (nota1 + nota2) / 2;
}

verificarAprovacao(double media, {String nome = "Teste"}) {
  if (media >= 7) {
    print("Aluno: $nome, Aprovado com media: $media");
  } else if (media >= 4) {
    print("Aluno: $nome, Recuperação com media: $media");
  } else {
    print("Aluno: $nome, Reprovado com media: $media");
  }
}
