import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/LoginController.dart';
import 'package:webEconomize/controller/MetasController.dart';
import 'package:webEconomize/custom/dialog.dart';
import 'package:webEconomize/custom/input.dart';
import 'package:webEconomize/custom/textArea.dart';
import 'package:webEconomize/custom/widgetListaComButtons.dart';
import 'package:webEconomize/custom/button.dart';
import 'package:webEconomize/custom/widgetListaSemButtons.dart';
import 'package:webEconomize/domain/Meta.dart';

final _formKey = GlobalKey<FormState>();
class Metas extends StatefulWidget {
  @override
  _MetasState createState() => _MetasState();
}

class _MetasState extends State<Metas> {
  MetasController metasController; 
  @override
  Widget build(BuildContext context) {
    metasController = Provider.of<MetasController>(context, listen: false);
    int idlogin = Provider.of<LoginController>(context, listen: false).loginUsuario.idlogin;
    metasController.consultarMetas(idlogin);
    return Scaffold(
      backgroundColor: Color(0xff1B384A),
      body: SingleChildScrollView(
        child: Consumer<MetasController>( 
        builder: (context, metasControllerConsumer, child) {
          return Column(
            children: <Widget>[ 
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Metas não Concluidos",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                  ),
                )
              ),

              _buildListaCardBotoes(metasControllerConsumer.listaInfosMetasNaoConcluidas),
              
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Metas Concluidos",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                  ),
                )
              ),

              _buildListaCardSemBotes(metasControllerConsumer.listaInfosMetasConcluidas),

              Container(
                margin: EdgeInsets.all(10),            
                child: ButtonLabel("Cadastrar Metas",(){
                  _buildDialogCadastroMetas();
                }, color: Color(0xFF008ABE), textColor: Colors.white)
              ),
            ],
          );
        }),
      )
    );
  }
  _buildListaCardSemBotes(List<Meta> lista){
    if(lista.length >0){
      return WidgetListaSemButtons(lista, true);
    }else{
      return Container();
    }
  }

  _buildListaCardBotoes(List<Meta> lista){
    if(lista.length > 0){
      return WidgetListaComButtons(lista, true, 
        onTapConfirma: (idmeta) async{
          showLoaderDialog(context);
          String respostaConcluirMeta = await metasController.concluirMeta(idmeta, Provider.of<LoginController>(context, listen: false).loginUsuario.idlogin);
          Navigator.pop(context);

          Flushbar(
            title: "Conclusão de Meta",
            backgroundColor: Colors.black,
            message: respostaConcluirMeta,
            duration: Duration(seconds: 2),
          )..show(context);
        },

        onTapExcluir: (idmeta) async{
          showLoaderDialog(context);
          String respostaRemoverMeta = await metasController.removerMeta(idmeta, Provider.of<LoginController>(context, listen: false).loginUsuario.idlogin);
          Navigator.pop(context);

          Flushbar(
            title: "Remoção de Meta",
            backgroundColor: Colors.black,
            message: respostaRemoverMeta,
            duration: Duration(seconds: 2),
          )..show(context);
        },  
        
      );
    }else{
      return Container();
    }
  }

  _buildDialogCadastroMetas() {
     Dialog simpleDialog = DialogCustom("Cadastrado de metas", _buildCorpoDialog());
     showDialog(context: context, builder: (BuildContext context) => simpleDialog);
  }

  _buildCorpoDialog(){
    return Container(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: InputLabel(
                  "Valor", 
                  (value){
                    metasController.metaCadastrar.valor = double.parse(value == "" ? "0.0" : value);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: InputLabel(
                  "Titulo da metas", 
                  (value){
                    metasController.metaCadastrar.titulo = value;
                  },
                ),
              ),
              Container(
                child: TextArea(
                  hintText: "Descrição de metas",
                  margin: 1.0,     
                  onTap: (value){
                    metasController.metaCadastrar.texto = value;
                  }         
                ),
              ),
              ButtonLabel("Cadastrar Metas",() async{
                _formKey.currentState.save();
                metasController.metaCadastrar.idlogin = Provider.of<LoginController>(context, listen: false).loginUsuario.idlogin;
                showLoaderDialog(context);
                String respostaCadastroMeta = await metasController.cadastrarMetas();
                Navigator.pop(context);

                Flushbar(
                  title: "Cadastro de Metas",
                  backgroundColor: Colors.black,
                  message: respostaCadastroMeta,
                  duration: Duration(seconds: 2),
                )..show(context);
              }, color: Color(0xff1B8F42), textColor: Colors.white),
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
