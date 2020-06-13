import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovSaida extends StatefulWidget {
  @override
  _MovSaidaState createState() => _MovSaidaState();
}

class _MovSaidaState extends State<MovSaida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B384A),
      body: Text(
        "Mov saida", 
        style: TextStyle(
            color: Colors.white
        )
      ),
    );
  }
}