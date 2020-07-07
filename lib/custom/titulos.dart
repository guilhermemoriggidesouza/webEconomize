
import 'package:flutter/material.dart';

class TituloTela extends StatelessWidget {

  String titulo;
  double sizeFont;

  TituloTela({
    this.titulo,
    this.sizeFont
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      width: MediaQuery.of(context).size.width / 1,
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
          fontSize: sizeFont,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
