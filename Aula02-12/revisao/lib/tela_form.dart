import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TelaFormulario extends StatefulWidget {
  @override
  _TelaFormularioState createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {

  TextEditingController edtNome = TextEditingController();
  String exemplo;
  double pontuacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      title: Text("Exemplo"),
      actions: [
      IconButton(icon: Icon(Icons.search),onPressed: (){_exibirDialog();},)
    ],
    );
  }

  _body() {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: edtNome,
            decoration: InputDecoration(
              labelText: "Nome",
              hintText: "Digite um Nome",
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0,10,10,10),
                child: Text("Estados"),
              ),
              DropdownButton<String>(
                value: exemplo,
                onChanged: (itemSelected){
                  exemplo = itemSelected;
                  debugPrint(exemplo);
                },
                items: ["PB", "RN", "RS"]
                    .map<DropdownMenuItem<String>>((value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),

                  );
                }).toList(),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0,10,10,10),
                child: Text("Nota: "),
              ),
              SmoothStarRating(
                rating: 3,
                starCount: 5,
                onRated: (value){
                  pontuacao = value;
                  debugPrint(pontuacao.toString());
                },
                size: 50,
              )
            ],
          )
        ],
      ),
    );
  }

  _exibirDialog() async{
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            title: Text("Exemplo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text("Alert Dialog"),
                  ],
                )
              ],
            ),
            actions: [
              FlatButton(
                child: Text("Ok"),
                onPressed: (){

                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Talvez"),
                onPressed: (){

                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Cancel"),
                onPressed: (){

                  Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
  }
}
