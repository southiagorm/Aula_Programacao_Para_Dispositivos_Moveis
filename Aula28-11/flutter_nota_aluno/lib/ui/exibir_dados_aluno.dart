import 'package:flutter/material.dart';
import 'package:flutternotaaluno/model/aluno.dart';

class ExibirDados extends StatefulWidget {

  Aluno aluno;

  ExibirDados(this.aluno);

  @override
  _ExibirDadosState createState() => _ExibirDadosState();
}

class _ExibirDadosState extends State<ExibirDados> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      title: Text("Exibir Dados"),
    );
  }

  _body() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nome: ${widget.aluno.nome}"),
          Text("Primeira Nota: ${widget.aluno.nota1}"),
          Text("Segunda Nota: ${widget.aluno.nota2}"),
          Text("Média: ${(widget.aluno.nota1+widget.aluno.nota2)/2}")
        ],
      ),
    );
  }
}

