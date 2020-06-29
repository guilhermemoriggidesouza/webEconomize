import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Metas extends StatefulWidget {
  @override
  _MetasState createState() => _MetasState();
}

class _MetasState extends State<Metas> {
  final List<String> mensagem = ["1 diuwecwlcnlrwkfwefewfefewfewffw", "2 eewddewdeedwedewdedweded", "3 ewdewdewdewdewdewdedewdwd", "4 wfwfewfqefefwefwfwefwef"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B384A),
      body: 
        Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.35,
        child: Column(
         children: <Widget>[
          Text("Metas não concluidas"),
          ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: mensagem.length, itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Card(
                    color: Color(0xff142129),
                    child: Column(
                      children: <Widget>[
                        Text(mensagem[index], style: TextStyle(color: Colors.white, fontSize: 10.0),),
                        new FlatButton(
                          child: const Text('Confirmar'),
                          color: Colors.blue,
                          onPressed: () { /* ... */ },
                        ),
                        new FlatButton(
                          child: const Text('Excluir'),
                          color: Colors.red,
                          onPressed: () { /* ... */ },
                        )
                      ]
                    )
                  ),
          
                );
              }
            ),
          Text("Metas concluidas"),
          ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: mensagem.length, itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Card(
                    color: Color(0xff142129),
                    child: Column(
                      children: <Widget>[
                        Text(mensagem[index], style: TextStyle(color: Colors.white, fontSize: 10.0),),
                        new FlatButton(
                          child: const Text('Excluir'),
                          color: Colors.red,
                          onPressed: () { /* ... */ },
                        ),
                      ]
                    )
                  ),
                );
              }
            ),
         ]
        )
      )
    );
  }
}