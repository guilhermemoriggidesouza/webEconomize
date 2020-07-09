import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/LoginController.dart';
import 'package:webEconomize/controller/SalarioController.dart';
import 'package:webEconomize/custom/button.dart';
import 'package:webEconomize/custom/dialog.dart';
import 'package:webEconomize/custom/input.dart';

final _formKey = GlobalKey<FormState>();
final _formKeyModal = GlobalKey<FormState>();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B384A),
      body: Form(
        key: _formKey,
        child:SingleChildScrollView(
          child:Column(
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
              },obscure:true),

              _buildBottomButtonsLogin()
            ],
          )
        )
      ) 
    );
  }

  _buildBottomButtonsLogin(){
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Row(
          children: <Widget>[

            Container(
              child: _buildButtonLogin('Entrar', EdgeInsets.only(top: 8.0, bottom: 8.0, right: 10), EdgeInsets.zero, () async{
                _formKey.currentState.save();

                showLoaderDialog(context);
                Map<String, dynamic> retorno = await Provider.of<LoginController>(context, listen: false).validarLogin(context);
                Navigator.pop(context);
                
                Flushbar(
                  title: "Login",
                  backgroundColor: Colors.black,
                  message: retorno["msg"],
                  duration: Duration(seconds: 5),
                )..show(context);
              })
            ),

            Expanded(
              child: _buildButtonLogin('Registrar', EdgeInsets.symmetric(vertical: 8.0), EdgeInsets.symmetric(horizontal:8), (){
                DialogCustom dialogo = DialogCustom("Cadastrar Login", _buildCorpoDialog());
                showDialog(context: context, builder: (BuildContext context) => dialogo);
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
        onTap,
        padding: padding,
        internalPadding: secondPadding,
        height: 35,
      ),
    );
  }

  _buildLoginInput(String text, Function(String) onSaved, {EdgeInsets margin, bool obscure: false}){
    return Center(
      child: Container(
        margin: margin != null ? margin : EdgeInsets.zero,
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child:InputLabel(text, onSaved, obscureInput: obscure),
        ),    
      )
    );
  }

  Container _buildCorpoDialog(){
    return Container(
      child:Form(
        key: _formKeyModal,
        child: Column(
          children: <Widget>[
            InputLabel("Login", (value){
              Provider.of<LoginController>(context, listen: false).loginCadastro.login = value;
            }),
            InputLabel("Senha", (value){
              Provider.of<LoginController>(context, listen: false).loginCadastro.senha = value;
            }),
            InputLabel("Nome", (value){
              Provider.of<LoginController>(context, listen: false).loginCadastro.nome = value;
            }),
            Container(
              child: ButtonLabel(
                "Cadastrar login", 
                () async{
                  _formKeyModal.currentState.save();

                  showLoaderDialog(context);
                  dynamic msgCadastro = await Provider.of<LoginController>(context, listen: false).cadastrarLogin();
                  Navigator.pop(context);

                  Flushbar(
                    title: "Login de salario",
                    backgroundColor: Colors.black,
                    message: msgCadastro,
                    duration: Duration(seconds: 5),
                  )..show(context);
                },
                color: Color(0xff1B8F42),
                textColor: Colors.white,
              ),
            )
          ]
        ),
      )
    );
  }

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

}