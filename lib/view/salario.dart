import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Salario extends StatefulWidget {
  @override
  _SalarioState createState() => _SalarioState();
}

class _SalarioState extends State<Salario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B384A),
      body: Text(
        "Salario", 
        style: TextStyle(
            color: Colors.white
        )
      ),     
    );
  }
}