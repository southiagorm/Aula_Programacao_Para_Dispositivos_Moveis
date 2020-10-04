import 'package:flutter/material.dart';

main() => runApp(MeuApp());

class MeuApp extends StatefulWidget {
  @override
  _MeuAppState createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {

  String _resultado = "";
  TextEditingController _edtCelsius = TextEditingController();

  void _convertCToF(){
      var celsius = double.parse(_edtCelsius.text);
      var fahrenheit = (9*celsius+160)/5;

      _resultado = "Fahrenheit: $fahrenheit";
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Conversor"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child:Column(
            children:[
              TextField(
                controller: _edtCelsius,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Celsius"
                ),
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: (){
                  setState(() {
                    _convertCToF();
                  });
                },
                child: Text("Converter")
              ),
              Row(
                children: [
                  Text(_resultado, style: TextStyle(fontSize:16),)
                ],
              )
            ]
          )
        ),
      )
    );
  }
}
