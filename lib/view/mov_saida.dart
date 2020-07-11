import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/widgets.dart';
import 'package:webEconomize/custom/textArea.dart';
import 'package:webEconomize/custom/widgetListaCard.dart';
import 'package:webEconomize/custom/button.dart';
import 'package:webEconomize/custom/input.dart';
import 'package:webEconomize/custom/dialog.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/MovSaidaController.dart';
import 'package:webEconomize/controller/SalarioController.dart';

final _formKeyModal = GlobalKey<FormState>();

class MovSaida extends StatefulWidget {
  @override
  _MovSaidaState createState() => _MovSaidaState();
}

class _MovSaidaState extends State<MovSaida> {
    MovSaidaController movSaidaController; 

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
      movSaidaController = Provider.of<MovSaidaController>(context, listen: false);
      return Scaffold(
        backgroundColor: Color(0xff1B384A),
        body: ListView(
          children: <Widget>[

            WidgetListaCard(movSaidaController.listaInfosMovSaidaNaoConcluidas, true, 
            onTapConfirma:(index){
              movSaidaController.concluirMovSaida(index);
            }, 
            onTapExcluir: (index){
              movSaidaController.removerMovSaida(index);
            },  
            mostrarBotaoConfirma: true),


            WidgetListaCard(movSaidaController.listaInfosMovSaidaConcluidas, true, 
            onTapExcluir: (index){
              movSaidaController.removerMovSaida(index);
            },  
            mostrarBotaoConfirma: false),
            _buildButtomCadastrar()
          ],
        )
    );
  }

  _buildButtomCadastrar() {
    if(Provider.of<SalarioController>(context).listaSalarios.length !=0 && 
    Provider.of<SalarioController>(context).salario.idsalario == Provider.of<SalarioController>(context).listaSalarios.last.idsalario){
      return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
        child:ButtonLabel(
          "Cadastrar Movimento de Saída", 
          (){_buildMovSaida();}, 
          color: Color(0xFF008ABE), 
          textColor: Colors.white
        )
      );
    } else {
      return Container();
    }

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
                child: InputLabel("Título Movimento", (value){
                   movSaidaController.movSaidaCadastrar.titulo = value;
                 })),
              TextArea(
                hintText: "Texto Movimento",
                margin: 0.0, 
                onTap: (value){
                  movSaidaController.movSaidaCadastrar.texto = value;
                },
              ),
              ButtonLabel(
                "Cadastrar Movimento de Saída", ()async {
                   _formKeyModal.currentState.save();
                  movSaidaController.movSaidaCadastrar.idsalario = Provider.of<SalarioController>(context, listen: false).salario.idsalario;
                  showLoaderDialog(context);
                  String respostaCadastroMovSaida = await movSaidaController.cadastrarMovSaida();
                  Navigator.pop(context);

                  Flushbar(
                    title: "Cadastro de Movimento",
                    backgroundColor: Colors.black,
                    message: respostaCadastroMovSaida,
                    duration: Duration(seconds: 2),
                  )..show(context);

                }, color: Color(0xFF1B8F42), textColor: Colors.white),
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
        child: SingleChildScrollView(
          child:Form(
            key: _formKeyModal,
            child: Column(
              children: <Widget>[
                InputLabel("Valor do Movimento", (value){ }),
                ButtonLabel(
                  "Concluir Movimento",() async{
                 
                }, color: Color(0xFF1B8F42), textColor: Colors.white),
              ]
            ),
          )
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


