import 'package:flutter/material.dart';
import 'package:webEconomize/custom/input.dart';

class WidgetMetaCadastro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
      child: Container(
        height: 45,
        width:  MediaQuery.of(context).size.width * 0.26,
        child: RaisedButton(
          color: Color(0xff3cb371),
          onPressed: (){},
          child: Text(
            "Cadastrar Movimento de Saída",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}