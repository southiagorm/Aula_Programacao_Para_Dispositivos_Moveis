import 'package:flutter/material.dart';
import 'package:flutternotaaluno/model/aluno.dart';
import 'package:flutternotaaluno/ui/exibir_dados_aluno.dart';

class PaginaHome extends StatefulWidget {
  @override
  _PaginaHomeState createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PaginaHome> {

  TextEditingController edtNome = TextEditingController();
  TextEditingController edtNota1 = TextEditingController();
  TextEditingController edtNota2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar(){
    return AppBar(
      title: Text("Cadastrar Aluno"),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: edtNome,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Nome"
            ),
          ),
          TextField(
            controller: edtNota1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Primeira nota"
            ),
          ),
          TextField(
            controller: edtNota2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Segunda nota"
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  color: Colors.blue,
                  child: Text("Enviar"),
                  onPressed: (){
                    var aluno = Aluno(
                        nome: edtNome.text,
                        nota1: double.parse(edtNota1.text),
                        nota2: double.parse(edtNota2.text));

                    _onClickIrParaTelaExibirDados(aluno);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _onClickIrParaTelaExibirDados(Aluno aluno) {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
      ExibirDados(aluno)
    ));
  }
  
  

}
