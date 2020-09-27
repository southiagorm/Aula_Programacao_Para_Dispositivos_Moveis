import 'package:flutter/material.dart';

main() => runApp(MeuApp());

class MeuApp extends StatefulWidget {
  @override
  _MeuAppState createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  TextEditingController edtNome = TextEditingController();
  TextEditingController edtNota1 = TextEditingController();
  TextEditingController edtNota2 = TextEditingController();

  String _resultado = "";

  void _calcularMedia(){
    setState(() {
      var nome = edtNome.text;
      var nota1 = double.parse(edtNota1.text);
      var nota2 =  double.parse(edtNota2.text);

      var media = (nota1+nota2)/2;
      var situacao = _verificarSituacao(media);

      _resultado = "Nome: $nome\n\n Média: $media\n\n Situação: $situacao";
    });
  }

  String _verificarSituacao(double media){
    if(media >= 7){
      return  "Aprovado";
    }else if(media >= 4){
      return "Recuperação";
    }else{
      return "Reprovado";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cálculo da Média"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                controller: edtNome,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Nome"
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                controller: edtNota1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Primeira Nota"
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                controller: edtNota2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Segunda Nota"
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: FlatButton(
                    color: Colors.blue,
                    child: Text("Calcular"),
                    onPressed: _calcularMedia,
                  ),
                )
              ],
            ),
            Text("$_resultado")
          ],
        ),
      ),
    );
  }
}
