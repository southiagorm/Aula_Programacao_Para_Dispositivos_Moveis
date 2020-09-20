import 'package:flutter/material.dart';

main() => runApp(MeuWidget());

class MeuWidget extends StatefulWidget {
  @override
  _MeuWidgetState createState() => _MeuWidgetState();
}

class _MeuWidgetState extends State<MeuWidget> {

  int _contador = 0;

  void _contar(){
    setState(() {
      _contador++;
      print(_contador);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contador"),
          actions: [
              IconButton(icon: Icon(Icons.refresh), onPressed: (){
                setState(() {
                  _contador = 0;
                });
              },)
          ],
        ),
        body:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("$_contador", style: TextStyle(fontSize: 25),),
                ),
                FlatButton(
                  color: Colors.red,
                  child: Icon(Icons.add),
                  onPressed: _contar,
                )
              ],
            )
          ],
        )
      )
    );
  }
}

