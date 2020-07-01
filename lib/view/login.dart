import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/LoginController.dart';
import 'package:webEconomize/controller/sessions/SessionLogin.dart';
import 'package:webEconomize/custom/button.dart';
import 'package:webEconomize/custom/input.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B384A),
      body: Column(
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top: 80),
            child: Image.asset("lib/assets/logo.png")
          ),
          
          _buildLoginInput("Login", (value){
            Provider.of<LoginController>(context, listen: false).email = value;
          }, margin: EdgeInsets.only(top: 56)),

          _buildLoginInput("Senha",(value){
            Provider.of<LoginController>(context, listen: false).senha = value;
          }),

          _buildBottomButtonsLogin()
        ],
      ) 
    );
  }

  _buildBottomButtonsLogin(){
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Row(
          children: <Widget>[

            Center(
              child: _buildButtonLogin('Entrar', EdgeInsets.only(top: 8.0, bottom: 8.0, right: 10), EdgeInsets.symmetric(horizontal:24), (){
                Provider.of<LoginController>(context, listen: false).validarLogin(context);
              })
            ),

            Expanded(
              child: _buildButtonLogin('Registrar', EdgeInsets.symmetric(vertical: 8.0), EdgeInsets.symmetric(horizontal:16), (){

              })
            )
            
          ],
        )
      ),
    );
  }

  _buildButtonLogin(String label, EdgeInsets padding, EdgeInsets secondPadding, Function onTap){
    return Container(
      child: ButtonLabel(
        label, 
        padding,
        secondPadding,
        onTap,
      ),
    );
  }

  _buildLoginInput(String text, Function(String) onSaved, {EdgeInsets margin}){
    return Center(
      child: Container(
        margin: margin != null ? margin : EdgeInsets.zero,
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child:InputLabel(text, onSaved),
        ),    
      )
    );
  }
}