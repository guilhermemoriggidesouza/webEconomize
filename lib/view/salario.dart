import 'dart:ffi';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/SalarioController.dart';
import 'package:webEconomize/custom/button.dart';
import 'package:webEconomize/custom/buttonIcon.dart';
import 'package:webEconomize/custom/input.dart';

final _formKey = GlobalKey<FormState>();

class Salario extends StatefulWidget {
  @override
  _SalarioState createState() => _SalarioState();
}

class _SalarioState extends State<Salario> {
  @override
  Widget build(BuildContext context) {
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
                margin: EdgeInsets.symmetric(horizontal: 40, vertical:10),
                child: ButtonLabel("Cadastrar Salario", (){
                  
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
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Simpe Custom Modal Dialog....',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Okay',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel!',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => simpleDialog);
  }

  _buildDataTableSalarios(){
    return Consumer<SalarioController>( 
      builder: (context, salarioController, child){

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
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
      lista.forEach((element) {
        dataRows.add(_buildDataRows(element.dataCadastro, element.salarioFixo.toString(), element));
      });
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

  _buildDataRows(String data, String valor, salario){
    return DataRow(cells: [
      DataCell(
        Container(
          child: Row(
            children: <Widget>[
              Container(
                width: 40,
                height: 35,
                margin: EdgeInsets.only(right: 10),
                child: ButtonIcon(Icon(FontAwesomeIcons.handPointer, color: Colors.white, size: 13), (){
                  Provider.of<SalarioController>(context, listen:false).mudarSalarioAtual(salario);
                }, color: Color(0xff1B8F42), internalPadding: EdgeInsets.zero)
              ),
              Container(
                width: 40,
                height: 35,
                child: ButtonIcon(Icon(FontAwesomeIcons.trash, color: Colors.white, size: 13), (){
                  String removeSalarioReturn = Provider.of<SalarioController>(context, listen: false).removerSalario(salario);

                  Flushbar(
                    title: "Remoção de salario",
                    backgroundColor: Colors.black,
                    message: removeSalarioReturn,
                    duration: Duration(seconds: 2),
                  )..show(context);
                }, color: Color(0xffB73232), internalPadding: EdgeInsets.zero,),
              ),
              
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildSomarSubtrairLabel("Somar", (value){
                Provider.of<SalarioController>(context, listen: false).modificarSomarSalario = value;
              }),

              _buildSomarSubtrairButton(Color(0xff1B8F42), Icon(FontAwesomeIcons.plus, color: Colors.white,), (){
                _formKey.currentState.save();
                Provider.of<SalarioController>(context, listen: false).adicionarSalario();
              }),
            ]
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildSomarSubtrairLabel("Subtrair", (value){
                Provider.of<SalarioController>(context, listen: false).modificarSubtrairSalario = value;
              }),

              _buildSomarSubtrairButton(Color(0xffB73232), Icon(FontAwesomeIcons.minus, color: Colors.white,), (){
                _formKey.currentState.save();
                Provider.of<SalarioController>(context, listen: false).diminuirSalario();
              }),
            ]
          )
        ],
      ),
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
            _buildLabelInfosSalario("Data cadastro:  ", salarioController.salario.dataCadastro),
            _buildLabelInfosSalario("Salario para utilizar:  ", salarioController.salario.salarioResto.toString()),
            _buildLabelInfosSalario("Salario total: ", salarioController.salario.salarioFixo.toString()),
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
}