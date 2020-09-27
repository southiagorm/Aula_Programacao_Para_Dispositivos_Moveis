import 'package:flutter/material.dart';

main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercício 1"),
        ),
        body: Column(
          children: [
            Image.asset('images/coliseum.jpg'),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Coliseu", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Text("Itália, Roma", style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.star, color: Colors.blue,),
                        Text("3.550", style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: (){},
                    child: Column(
                      children: [
                        Icon(Icons.phone),
                        Text("Telefone")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: (){},
                    child: Column(
                      children: [
                        Icon(Icons.add_location),
                        Text("Endereço")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: (){},
                    child: Column(
                      children: [
                        Icon(Icons.share),
                        Text("Compartilhar")
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text("Coliseu (em italiano: Colosseo), também conhecido como Anfiteatro Flaviano (em latim: Amphitheatrum Flavium; em italiano: Anfiteatro Flavio), é um anfiteatro oval localizado no centro da cidade de Roma, capital da Itália. Construído com tijolos revestidos de argamassa e areia, e originalmente cobertos com travertino[1] é o maior anfiteatro já construído e está situado a leste do Fórum Romano.",
                textAlign: TextAlign.justify,),
            )
          ],
        ),
      )
    );
  }
}
