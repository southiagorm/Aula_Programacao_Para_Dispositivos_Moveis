import 'package:flutter/material.dart';

main() => runApp(MeuApp());

class MeuApp extends StatefulWidget {
  @override
  _MeuAppState createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {

  //(peso/altura*altura)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text("Calcular Imc"),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Peso"
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura"
                  ),
                ),
                FlatButton(
                  color: Colors.blue,
                  onPressed: (){},
                  child: Text("Calcular"),
                ),
                Text("Resultado")
              ],
            ),
        ),
      )
    );
  }
}
