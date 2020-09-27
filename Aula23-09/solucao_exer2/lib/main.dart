import 'dart:math';

import 'package:flutter/material.dart';

main() => runApp(MeuWidget());

class MeuWidget extends StatefulWidget {
  @override
  _MeuWidgetState createState() => _MeuWidgetState();
}

class _MeuWidgetState extends State<MeuWidget> {

  int valor = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercício 2"),
        ),
        body: Column(
          children: [
            Text("$valor"),
            FlatButton(
              child: Text("Gerar"),
              onPressed: (){
                setState(() {
                  Random r = Random();
                  valor = r.nextInt(100);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
