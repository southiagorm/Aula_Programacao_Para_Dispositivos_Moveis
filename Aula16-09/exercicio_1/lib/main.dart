import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MeuWidget());

class MeuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Exercício 1"),
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 5, 5),
                            height: 50,
                            color: Colors.blue,
                            child: Center(child: Text("Um")))),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
                            height: 50,
                            color: Colors.red,
                            child: Center(child: Text("Dois"))))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  height: 50,
                  color: Colors.amber,
                  child: Center(child: Text("Três")),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 5, 5),
                        height: 50,
                        color: Colors.cyan,
                        child: Center(
                          child: Text("Quatro"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 5, 5),
                        height: 50,
                        color: Colors.cyanAccent,
                        child: Center(
                          child: Text("Cinco"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        height: 50,
                        color: Colors.deepPurpleAccent,
                        child: Center(
                          child: Text("Seis"),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                    color: Colors.teal,
                    child: Center(
                      child: Text("Sete"),
                    ),
                  ),
                )
              ],
            )));
  }
}
