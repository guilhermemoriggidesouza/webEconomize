import 'dart:ffi';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/LoginController.dart';
import 'package:webEconomize/controller/SalarioController.dart';
import 'package:webEconomize/custom/button.dart';
import 'package:webEconomize/custom/buttonIcon.dart';
import 'package:webEconomize/custom/dialog.dart';
import 'package:webEconomize/custom/input.dart';
import 'package:webEconomize/models/salario.dart';

final _formKey = GlobalKey<FormState>();
final _formKeySalario = GlobalKey<FormState>();

class Salario extends StatefulWidget {
  @override
  _SalarioState createState() => _SalarioState();
}

class _SalarioState extends State<Salario> {
  SalarioController salarioController;
  int idlogin;

  @override
  Widget build(BuildContext context) {
    salarioController = Provider.of<SalarioController>(context, listen: false);
    idlogin = Provider.of<LoginController>(context, listen: false).loginUsuario.idlogin;
    idlogin != null ? salarioController.recuperarSalarioUsuario(idlogin) : salarioController.limparSalario() ;
    return Scaffold(
      backgroundColor: Color(0xff1B384A),
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildTextTopo(),
              _buildInfosSalario(),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  "Modificar salario atual",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: ButtonLabel("Cadastrar Salario", (){
                  _buildDialogCreate();
                }, color: Color(0xff008ABE), textColor: Colors.white)
              ),
              
              _buildInputsModificarSomarSubtrair(),
              _buildDataTableSalarios()
            ],
          )
        ),
      ) 
    );
  }

  _buildDialogCreate(){
    Dialog simpleDialog = DialogCustom("Cadastrar Login", _buildCorpoDialog());
    showDialog(context: context, builder: (BuildContext context) => simpleDialog);
  }

  _buildCorpoDialog(){
    return Container(
      child: Form(
        key: _formKeySalario,
        child: Column(
          children: <Widget>[
            InputLabel("Valor Salario", (value){
              salarioController.salarioCadastrar.salarioFixo = double.parse(value);
              salarioController.salarioCadastrar.salarioResto = double.parse(value);
              salarioController.salarioCadastrar.idlogin = idlogin;
            }),
            ButtonLabel("Cadastrar Salario", () async{
              _formKeySalario.currentState.save();
              showLoaderDialog(context);
              String mensagem = await salarioController.cadastrarSalario();
              Navigator.pop(context);

              Flushbar(
                title: "Cadastro de salario",
                backgroundColor: Colors.black,
                message: mensagem,
                duration: Duration(seconds: 5),
              )..show(context);
            }, color: Color(0xff1B8F42), textColor: Colors.white)
          ],
        ),
      )
    );
  }

  _buildDataTableSalarios(){
    return Consumer<SalarioController>( 
      builder: (context, salarioController, child){

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(bottom: 10),
            color: Colors.black.withOpacity(0.3),
            child: DataTable(
            columns: _builListDataTableColumn(),
            rows: _buildListDataTableRows(salarioController.listaSalarios),
          ),
        )
      );

    });
  }

  _buildListDataTableRows(lista){
      List<DataRow> dataRows = [];
      if(lista.length > 0){
        lista.asMap().forEach((index, element) {
          dataRows.add(_buildDataRows(element.dataCadastro, element.salarioFixo.toString(), element, (index == lista.length-1)));
        });
      }
      return dataRows;
  }

  _builListDataTableColumn(){
    return [
      DataColumn(
        label: Text(
          "Ações",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        )
      ),
      DataColumn(
        label: Text(
          "Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        )
      ),
      DataColumn(
        label: Text(
          "Valor",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        )
      )
    ];
  }

  _buildDataRows(String data, String valor, salarioRec, bool mostrarDelete){
    Color corBotao = salarioController.salario.idsalario == salarioRec.idsalario ? Color(0xff008ABE): Color(0xff1B8F42);
    return DataRow(cells: [
      DataCell(
        Container(
          width: 90,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: ButtonIcon(Icon(FontAwesomeIcons.handPointer, color:  Colors.white, size: 13), (){
                  salarioController.mudarSalarioAtual(salarioRec);
                }, color: corBotao, internalPadding: EdgeInsets.zero)
              ),
             _buildBotaoExcluir(mostrarDelete, salarioRec)
              
            ]
          )
        )
      ),
      DataCell(
        Text(
          data,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14
          ),
        )
      ),
      DataCell(
        Text(
          valor,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14
          ),
        )
      ),
    ]);
  }

  _buildBotaoExcluir(bool botaoAparece, salarioDel){
    if(botaoAparece){
      return Expanded(
        child: ButtonIcon(Icon(FontAwesomeIcons.trash, color: Colors.white, size: 13), () async{
          showLoaderDialog(context);
          String removeSalarioReturn = await salarioController.removerSalario(salarioDel);
          Navigator.pop(context);

          Flushbar(
            title: "Remoção de salario",
            backgroundColor: Colors.black,
            message: removeSalarioReturn,
            duration: Duration(seconds: 2),
          )..show(context);
        }, color: Color(0xffB73232), internalPadding: EdgeInsets.zero,),
      );
    }else{
      return Container();
    }
  }

  _buildSomarSubtrairLabel(String text, Function(String) setLabel){
    return Center(
      child:Container(
        width: 120,
        child: InputLabel(
          text,
          setLabel,
        ),
      ),
    );
  }

  _buildSomarSubtrairButton(Color color, Icon icon, Function buttonTap){
    return Container(
      width: 95,
      height: 40,
      child:Center(
        child: ButtonIcon(icon, buttonTap, color: color, margin: EdgeInsets.symmetric(horizontal: 10)),
      )
    );
  }


  _buildInputsModificarSomarSubtrair(){
    return Consumer<SalarioController>( 
      builder: (context, salarioController, child){
        if(salarioController.listaSalarios.length !=0 && 
          salarioController.salario.idsalario == salarioController.listaSalarios.last.idsalario
        ){

          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildSomarSubtrairLabel("Somar", (value){
                      salarioController.valorModificarMais =  double.parse(value == "" ? "0.0" : value);
                    }),

                    _buildSomarSubtrairButton(Color(0xff1B8F42), Icon(FontAwesomeIcons.plus, color: Colors.white,), ()async{
                      _formKey.currentState.save();
                      showLoaderDialog(context);
                      String mensagem = await salarioController.modificarSalarioMais();
                      Navigator.pop(context);

                      Flushbar(
                        title: "Cadastro de salario",
                        backgroundColor: Colors.black,
                        message: mensagem,
                        duration: Duration(seconds: 5),
                      )..show(context);
                    }),
                  ]
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildSomarSubtrairLabel("Subtrair", (value){
                      salarioController.valorModificarMenos = double.parse(value == "" ? "0.0" : value);
                    }),

                    _buildSomarSubtrairButton(Color(0xffB73232), Icon(FontAwesomeIcons.minus, color: Colors.white,), ()async{
                      _formKey.currentState.save();
                      showLoaderDialog(context);
                      String mensagem = await salarioController.modificarSalarioMenos();
                      Navigator.pop(context);

                      Flushbar(
                        title: "Cadastro de salario",
                        backgroundColor: Colors.black,
                        message: mensagem,
                        duration: Duration(seconds: 5),
                      )..show(context);
                    }),
                  ]
                )
              ],
            ),
          );

        }else{
          return Container();
        }

      }
    );
  }

  _buildTextTopo(){
     return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Informações salario atual",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white
            )
          ),
          WidgetSpan(
            child: Icon(Icons.monetization_on, size: 27, color: Colors.white),
          ),
        ],
      ),
    );
  }

  _buildInfosSalario(){
    return Consumer<SalarioController>(
      builder: (context, salarioController, child){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildLabelInfosSalario("Data cadastro:  ", salarioController.salario.dataCadastro??""),
            _buildLabelInfosSalario("Salario para utilizar:  ", salarioController.salario.salarioResto.toString()??""),
            _buildLabelInfosSalario("Salario total: ", salarioController.salario.salarioFixo.toString()??""),
          ],
        );
      }
    );
  }

  _buildLabelInfosSalario(info, valor){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child:Text(info,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white38
            ),
          )
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Text(valor,  
            style: TextStyle(
              fontSize: 18,
              color: Colors.white
            )
          )
        )
      ],
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