import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/LoginController.dart';
import 'package:webEconomize/controller/PoupancaController.dart';
import 'package:webEconomize/controller/SalarioController.dart';
import 'package:webEconomize/custom/buttonIcon.dart';
import 'package:webEconomize/custom/input.dart';
import 'package:webEconomize/custom/titulos.dart';

final _formKey = GlobalKey<FormState>();

class Poupanca extends StatefulWidget {
  @override
  _PoupancaState createState() => _PoupancaState();
}

class _PoupancaState extends State<Poupanca> {
  PoupancaController poupancaController;
  double dbPoupanca = 2000.00;
  double dbPoupancaDesteSalario = 2000.00;

  @override
  Widget build(BuildContext context) {
    poupancaController = Provider.of<PoupancaController>(context, listen: false);
    int idsalario = Provider.of<SalarioController>(context, listen: false).salario.idsalario;
    int idlogin = Provider.of<LoginController>(context, listen: false).loginUsuario.idlogin;
    
    if(idsalario != null && idlogin !=null) {
      poupancaController.recuperarPoupanca(idsalario, idlogin);
    }else{
      poupancaController.limparPoupanca();
    }
    return Scaffold(
      backgroundColor: Color(0xff1B384A),
      body: SingleChildScrollView(
        child: Container(
          child: Wrap(
            direction: Axis.horizontal,
            children: <Widget>[
              TituloTela(titulo: "Poupança", sizeFont: 27,),
              SizedBox(height: 100,),
              _buildPoupancaTotalOuPoupancaDoSalario(true),
              _buildPoupancaTotalOuPoupancaDoSalario(false),
              SizedBox(height: 70,),
              _buildInputsModificarSomarSubtrair(),
            ],
          ),
        )
      ),
    );
  }

  _buildPoupancaTotalOuPoupancaDoSalario(bool isPoupancaTotal){
    return Consumer<PoupancaController>( 
      builder: (context, poupancaController, child){
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
                              isPoupancaTotal ? "${poupancaController.poupancaGeral}" : "${poupancaController.poupanca.valor}",
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
    );
      
  }

  _buildInputsModificarSomarSubtrair(){
    if(Provider.of<SalarioController>(context).listaSalarios.length !=0 && 
      Provider.of<SalarioController>(context).salario.idsalario == Provider.of<SalarioController>(context).listaSalarios.last.idsalario
    ){
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TituloTela(titulo: "Modificar salario atual", sizeFont: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildSomarSubtrairLabel("Somar", (value){
                  poupancaController.valorModificarMais = double.parse(value == "" ? "0.0" : value);
                }),

                _buildSomarSubtrairButton(Color(0xff1B8F42), Icon(FontAwesomeIcons.plus, color: Colors.white), () async{
                  _formKey.currentState.save();
  
                  showLoaderDialog(context);
                  String mensagem = await poupancaController.modificarSalarioMais();
                  Navigator.pop(context);
                  
                  Flushbar(
                    title: "Somar Poupanca",
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
                  poupancaController.valorModificarMenos = double.parse(value == "" ? "0.0" : value);
                }),

                _buildSomarSubtrairButton(Color(0xffB73232), Icon(FontAwesomeIcons.minus, color: Colors.white), () async{
                  _formKey.currentState.save();
  
                  showLoaderDialog(context);
                  String mensagem = await poupancaController.modificarSalarioMenos();
                  Navigator.pop(context);

                  Flushbar(
                    title: "Subtrair Poupanca",
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