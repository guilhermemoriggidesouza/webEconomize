import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/widgets.dart';
import 'package:webEconomize/custom/textArea.dart';
import 'package:webEconomize/custom/widgetListaComButtons.dart';
import 'package:webEconomize/custom/button.dart';
import 'package:webEconomize/custom/input.dart';
import 'package:webEconomize/custom/dialog.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/MovSaidaController.dart';
import 'package:webEconomize/controller/SalarioController.dart';
import 'package:webEconomize/custom/widgetListaSemButtons.dart';
import 'package:webEconomize/domain/MovSaida.dart';

final _formKeyModal = GlobalKey<FormState>();

class MovSaidas extends StatefulWidget {
  @override
  _MovSaidasState createState() => _MovSaidasState();
}

class _MovSaidasState extends State<MovSaidas> {
  MovSaidaController movSaidaController; 
  @override
  Widget build(BuildContext context) {
      movSaidaController = Provider.of<MovSaidaController>(context, listen: false);
      return Scaffold(
        backgroundColor: Color(0xff1B384A),
              body: SingleChildScrollView(
        child: Consumer<MovSaidaController>( 
        builder: (context, movSaidaControllerConsumer, child) {
          return Column(
            children: <Widget>[ 
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Mov não Concluidas",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                  ),
                )
              ),

              _buildListaCardBotoes(movSaidaControllerConsumer.listaInfosMovSaidaNaoConcluidas),
              
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Mov Concluidas",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                  ),
                )
              ),

              _buildListaCardSemBotes(movSaidaControllerConsumer.listaInfosMovSaidaConcluidas),

              Container(
                margin: EdgeInsets.all(10),            
                child: _buildButtomCadastrar()
              ),
            ],
          );
        }),
    )
   );
  
  }
    }
  _buildListaCardSemBotes(List<MovSaida> lista){
    if(lista.length >0){
      return WidgetListaSemButtons(lista, false);
    }else{
      return Container();
    }
  }

  _buildListaCardBotoes(List<MovSaida> lista){
    if(lista.length > 0){
      return WidgetListaComButtons(lista, false, 
        onTapConfirma: (idmovSaida) async{
          showLoaderDialog(context);
          String respostaConcluirMovSaida = await movSaidaController.concluirMovSaida(idmovSaida, Provider.of<SalarioController>(context, listen: false).salario.idsalario);
          Navigator.pop(context);

          Flushbar(
            title: "Conclusão de Mov",
            backgroundColor: Colors.black,
            message: respostaConcluirMovSaida,
            duration: Duration(seconds: 2),
          )..show(context);
        },

        onTapExcluir: (idmovSaida) async{
          showLoaderDialog(context);
          String respostaRemoverMovSaida = await movSaidaController.removerMovSaida(idmovSaida, Provider.of<SalarioController>(context, listen: false).salario.idsalario
          Navigator.pop(context);

          Flushbar(
            title: "Remoção de Mov",
            backgroundColor: Colors.black,
            message: respostaRemoverMovSaida,
            duration: Duration(seconds: 2),
          )..show(context);
        },  
        
      );
    }else{
      return Container();
    }
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


