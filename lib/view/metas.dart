import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webEconomize/custom/widgetListaCard.dart';
import 'package:webEconomize/custom/widgetMetaCadastro.dart';

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
        WidgetListaCard(mensagemNaoConcluida, mostrarBotaoConfirma: true),
        WidgetListaCard(mensagemNaoConcluida,  mostrarBotaoConfirma: false),
        WidgetMetaCadastro(),
      ],
    );
  }
}
