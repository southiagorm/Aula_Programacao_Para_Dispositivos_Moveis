import 'package:flutter/material.dart';

main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Primeiro App"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.lightBlueAccent,
                  width: 100,
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  margin: EdgeInsets.all(10),
                  transform: Matrix4.rotationZ(0.20),
                  child: Text("Texto 1", style: TextStyle(color: Colors.white),),
                ),
                Text("Texto 2"),
                Text("Texto 3")
              ],
            ),
            Row(
              children: [
                Container(
                  color: Colors.lightBlueAccent,
                  width: 100,
                  height: 50,
                  margin: EdgeInsets.all(10),
                  transform: Matrix4.rotationZ(0.20),
                  child: Center(
                    child: Text("Texto 1", style: TextStyle(color: Colors.white),),
                  ),
                ),
                Text("Texto 2"),
                Text("Texto 3")
              ],
            ),
            Row(
              children: [
                Container(
                  color: Colors.lightBlueAccent,
                  width: 100,
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  margin: EdgeInsets.all(10),
                  transform: Matrix4.rotationZ(0.20),
                  child: Text("Texto 1", style: TextStyle(color: Colors.white),),
                ),
                Text("Texto 2"),
                Text("Texto 3")
              ],
            )
          ],
        ),
      ),
    );
  }
}
