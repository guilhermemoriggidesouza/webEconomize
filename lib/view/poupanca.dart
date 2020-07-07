import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/SalarioController.dart';
import 'package:webEconomize/custom/buttonIcon.dart';
import 'package:webEconomize/custom/input.dart';
import 'package:webEconomize/custom/titulos.dart';

class Poupanca extends StatefulWidget {
  @override
  _PoupancaState createState() => _PoupancaState();
}

class _PoupancaState extends State<Poupanca> {

  static bool isPoupancaTotal = true;
  double dbPoupanca = 2000.00;
  double dbPoupancaDesteSalario = 2000.00;

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
        Container(
          height: MediaQuery.of(context).size.height / 1.23,
          decoration: BoxDecoration(border: Border.all(color: Colors.amber)),
          child: Wrap(
            direction: Axis.horizontal,
            children: <Widget>[
              TituloTela(titulo: "Poupança", sizeFont: 27,),
              SizedBox(height: 100,),
              _buildPoupancaTotalAndSalario(isPoupancaTotal),
              _buildPoupancaTotalAndSalario(!isPoupancaTotal),
              TituloTela(titulo: "Modificar salario atual", sizeFont: 20),
              SizedBox(height: 70,),
              _buildInputsModificarSomarSubtrair(),
            ],
          ),
        )
      ],
    );
  }

  _buildPoupancaTotalAndSalario(bool isPoupancaTotal){
    print(isPoupancaTotal);
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),  
      child: Container(
        width: MediaQuery.of(context).size.width / 1,
        height: 100,
        child: Wrap(
          spacing: 5,
          textDirection: isPoupancaTotal ? TextDirection.ltr : TextDirection.rtl,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: isPoupancaTotal ? FaIcon(FontAwesomeIcons.piggyBank) : FaIcon(FontAwesomeIcons.moneyBillAlt) ,
                onPressed: (){},
                color: Colors.white,
                iconSize: 50,
              ),
            ),
            Container(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Wrap(
                  textDirection: isPoupancaTotal ? TextDirection.ltr : TextDirection.rtl,
                  direction: Axis.vertical,
                  children: <Widget>[
                    Text(
                       isPoupancaTotal ? "Poupança total" : "Poupança total deste salario",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Wrap(
                      spacing: 10,
                      children: <Widget>[
                        Icon(
                          Icons.monetization_on,
                          size: 18,
                          color: Colors.white,
                        ),
                        Text(
                          isPoupancaTotal ? "${dbPoupanca}" : "${dbPoupancaDesteSalario}",
                          style: TextStyle(
                          color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildInputsModificarSomarSubtrair(){
    return Form(
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
                Provider.of<SalarioController>(context, listen: false).diminuirSalario();
              }),
            ]
          )
        ],
      ),
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

}