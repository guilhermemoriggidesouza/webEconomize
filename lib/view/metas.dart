import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Metas extends StatefulWidget {
  @override
  _MetasState createState() => _MetasState();
}

class _MetasState extends State<Metas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B384A),
      body: Text(
        "Metas", 
        style: TextStyle(
            color: Colors.white
        )
      ),
    );
  }
}