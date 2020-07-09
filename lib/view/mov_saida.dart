import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webEconomize/custom/textArea.dart';
import 'package:webEconomize/custom/widgetListaCard.dart';
import 'package:webEconomize/custom/button.dart';
import 'package:webEconomize/custom/input.dart';
import 'package:webEconomize/custom/dialog.dart';

final _formKeyModal = GlobalKey<FormState>();

class MovSaida extends StatefulWidget {
  @override
  _MovSaidaState createState() => _MovSaidaState();
}

class _MovSaidaState extends State<MovSaida> {

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
      backgroundColor: Color(0xff1B384A),
      body: _buildBody(),
    );
  }
  _buildBody(){
    return ListView(
      children: <Widget>[
        WidgetListaCard(mensagemNaoConcluida, 1, (){
          _buildDialogConfirma();
        }, (){
        },  mostrarBotaoConfirma: true),
        WidgetListaCard(mensagemNaoConcluida, 1,(){
        }, (){
        },  mostrarBotaoConfirma: false),
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
          child:ButtonLabel(
        "Cadastrar Movimento de Saída", (){_buildMovSaida();}, color: Color(0xFF008ABE), textColor: Colors.white)),
      ],
    );
  }

  _buildMovSaida(){
    Dialog dialogo = DialogCustom("Cadastro de Movimento", _buildCorpoDialog());
                showDialog(context: context, builder: (BuildContext context) => dialogo);
    return dialogo;
  }

  Container _buildCorpoDialog(){
      return Container(
        child:Form(
          key: _formKeyModal,
          child: Column(
            children: <Widget>[
              Container(
                width: 273,
                child: InputLabel("Título Movimento", (value){ })),
              TextArea(
                hintText: "Texto Movimento",
                margin: 0.0,  ),
              ButtonLabel(
                "Cadastrar Movimento de Saída", (){}, color: Color(0xFF1B8F42), textColor: Colors.white),
            ]
            ),
        )
      );
    }

  _buildDialogConfirma(){
     Dialog dialogo = DialogCustom("Informe o Movimento", _buildCorpoConfirma());
                showDialog(context: context, builder: (BuildContext context) => dialogo);
    return dialogo;
  }

  Container _buildCorpoConfirma(){
      return Container(
        child:Form(
          key: _formKeyModal,
          child: Column(
            children: <Widget>[
              InputLabel("Valor do Movimento", (value){ }),
              ButtonLabel(
                "Concluir Movimento", (){}, color: Color(0xFF1B8F42), textColor: Colors.white),
            ]
          ),
        )
      );
     }
}


