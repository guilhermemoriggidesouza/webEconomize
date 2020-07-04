import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webEconomize/custom/widgetListaCard.dart';
import 'package:webEconomize/custom/widgetMetaCadastro.dart';

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
        WidgetListaCard(mensagemNaoConcluida, 1, mostrarBotaoConfirma: true),
        WidgetListaCard(mensagemNaoConcluida, 1,  mostrarBotaoConfirma: false),
        WidgetMetaCadastro(),
      ],
    );
  }
}