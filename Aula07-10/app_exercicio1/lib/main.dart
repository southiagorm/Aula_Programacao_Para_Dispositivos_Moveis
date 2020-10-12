import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum Opcoes {IMPOSTO, NOVOSALARIO, CLASSIFICACAO}

class _MyAppState extends State<MyApp> {

  Opcoes opcoes = Opcoes.IMPOSTO;
  TextEditingController edtSalario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Empresa"),
        ),
        body: Container(
          child: Column(
            children: [
              Text("Menu de Opções", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ListTile(
                title: Text("Imposto"),
                leading: Radio(
                  value: Opcoes.IMPOSTO,
                  groupValue: opcoes,
                  onChanged: (Opcoes value){
                    setState(() {
                      opcoes = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Novo Salário"),
                leading: Radio(
                  value: Opcoes.NOVOSALARIO,
                  groupValue: opcoes,
                  onChanged: (Opcoes value){
                    setState(() {
                      opcoes = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Classificação"),
                leading: Radio(
                  value: Opcoes.CLASSIFICACAO,
                  groupValue: opcoes,
                  onChanged: (Opcoes value){
                    setState(() {
                      opcoes = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: edtSalario,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Salário"
                  ),
                ),
              ),
              RaisedButton(
                child: Text("Calcular"),
                onPressed: (){
                  double salario = double.parse(edtSalario.text);
                  double imposto;
                  switch(opcoes){
                    case Opcoes.IMPOSTO:
                      if(salario > 850){
                        imposto = salario * 0.15;
                      }else if(salario > 500){
                        imposto = salario * 0.1;
                      }else{
                        imposto = salario * 0.05;
                      }
                      break;
                  }
                  print("Imposto: $imposto");
                  edtSalario.text = "";
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("Imposto: $imposto"),
                    );
                  });
                },
              )
            ],
          ),
        ),
    );
  }
}
