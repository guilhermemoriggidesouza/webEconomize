import 'dart:ffi';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
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

  final _dateFormat = DateFormat('dd/MM/yyyy');

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
                  _buildCadastroSalario();
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

  // decoration: BoxDecoration(border: Border.all(color: Colors.amber)), Para teste
  _buildCadastroSalario(){
    Dialog dialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xff1B384A),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15, left: 25, right: 25),
            child: Wrap(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 40,
                  child: Wrap(
                    spacing: 20,
                    alignment: WrapAlignment.spaceAround,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 180,
                        child: Text(
                          "Cadastro de salario",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        )
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        width: 50,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: (){
                            Navigator.of(context, rootNavigator: true).pop('dialog');
                          },
                        )
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.monetization_on),
                            hintText: "Valor"
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: DateTimeField(
                           decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Data",
                            suffixStyle: TextStyle(fontSize: 10),
                            icon: Icon(Icons.date_range), 
                          ),
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100),
                            );
                          }, 
                          format: _dateFormat,  
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Color(0xff1B8F42),
                    onPressed: (){},
                    child: Text(
                      "Cadastra movimento de saida",
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 15, 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
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

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          color: Colors.black.withOpacity(0.3),
          child: DataTable(
          columns: _builListDataTableColumn(),
          rows: _buildListDataTableRows(salarioController.listaSalarios),
        ),
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