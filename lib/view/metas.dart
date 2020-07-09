import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webEconomize/custom/dialog.dart';
import 'package:webEconomize/custom/input.dart';
import 'package:webEconomize/custom/textArea.dart';
import 'package:webEconomize/custom/widgetListaCard.dart';
import 'package:webEconomize/custom/button.dart';

class Metas extends StatefulWidget {
  @override
  _MetasState createState() => _MetasState();
}

class _MetasState extends State<Metas> {
  final List<String> mensagemNaoConcluida = [
    "é simplesmente um texto fictício da indústria tipográfica e de impressão." +
        "Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500",
    "é simplesmente um texto fictício da indústria tipográfica e de impressão." +
        "Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500",
    "é simplesmente um texto fictício da indústria tipográfica e de impressão." +
        "Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500",
    "é simplesmente um texto fictício da indústria tipográfica e de impressão." +
        "Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500",
  ];
  final List<String> mensagemConcluida = [
    "é simplesmente um texto fictício da indústria tipográfica e de impressão." +
        "Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500",
    "é simplesmente um texto fictício da indústria tipográfica e de impressão." +
        "Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500",
    "é simplesmente um texto fictício da indústria tipográfica e de impressão." +
        "Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500",
    "é simplesmente um texto fictício da indústria tipográfica e de impressão." +
        "Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff1B384A),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return ListView(
      children: <Widget>[
        WidgetListaCard(mensagemNaoConcluida, 0,(){
          _buildDialogConfirma();
        }, (){
        },  mostrarBotaoConfirma: true),
        WidgetListaCard(mensagemNaoConcluida, 0,(){
          _buildDialogConfirma();
        }, (){
        },  mostrarBotaoConfirma: false),
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 20),            
          child: ButtonLabel("Cadastrar Metas",(){
            _buildDialogCadastroMetas();
          }, 
          color: Color(0xFF008ABE), 
          textColor: Colors.white
          )
        ),
      ],
    );
  }

  _buildDialogCadastroMetas() {
     Dialog simpleDialog = DialogCustom("Cadastrado de metas", _buildCorpoDialog());
     showDialog(context: context, builder: (BuildContext context) => simpleDialog);
  }

  _buildCorpoDialog(){
    return Container(
      height: MediaQuery.of(context).size.height / 2.6,
      child: Container(
        height: 80,
        child: Wrap(
          spacing: 10,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: <Widget>[
                  Container(
                    width: 75,
                    child: InputLabel(
                      "Valor", 
                      (value){},
                    ),
                  ),
                  Container(
                    width: 185,
                    child: InputLabel(
                      "Titulo da metas", 
                      (value){},
                    ),
                  ),
                ],
              ),
            ),
            TextArea(
              hintText: "Descrição de metas",
              margin: 1.0,              
            ),
            ButtonLabel("Cadastrar Salario",(){}, color: Color(0xff1B8F42), textColor: Colors.white),
          ],
        ),  
      ),
    );
  }
  _buildDialogConfirma(){
    return Container();
  }
}
