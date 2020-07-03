import 'package:flutter/material.dart';

class WidgetMetaCadastro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  MediaQuery.of(context).size.width * 0.26,
      child: RaisedButton(
        color: Color(0xff3cb371),
        onPressed: (){    
        },
        child: Text(
          "Cadastrar Movimento de Saída",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}