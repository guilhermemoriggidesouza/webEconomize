import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Poupanca extends StatefulWidget {
  @override
  _PoupancaState createState() => _PoupancaState();
}

class _PoupancaState extends State<Poupanca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B384A),
      body: Text(
        "Poupanca", 
        style: TextStyle(
            color: Colors.white
        )
      ),
    );
  }
}