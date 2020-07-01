import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/SalarioController.dart';
import 'package:webEconomize/custom/button.dart';
import 'package:webEconomize/custom/buttonIcon.dart';
import 'package:webEconomize/custom/input.dart';

class Salario extends StatefulWidget {
  @override
  _SalarioState createState() => _SalarioState();
}

class _SalarioState extends State<Salario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B384A),
      body:Container(
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

            _buildInputsModificarSomarSubtrair()
          ],
        )
      )
    );
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildSomarSubtrairLabel("Somar", (value)=>{
              
            }),

            _buildSomarSubtrairButton(Color(0xff1B8F42), Icon(FontAwesomeIcons.plus, color: Colors.white,), ()=>{

            }),
          ]
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildSomarSubtrairLabel("Subtrair", (value)=>{
              
            }),

            _buildSomarSubtrairButton(Color(0xffB73232), Icon(FontAwesomeIcons.minus, color: Colors.white,), ()=>{

            }),
          ]
        )
      ],
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
            _buildLabelInfosSalario("Data cadastro:  ", salarioController.dataCadastro),
            _buildLabelInfosSalario("Salario para utilizar:  ", salarioController.salarioResto.toString()),
            _buildLabelInfosSalario("Salario total: ", salarioController.salarioFixo.toString()),
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