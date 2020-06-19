import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/LoginController.dart';
import 'package:webEconomize/controller/SalarioController.dart';
import 'package:webEconomize/controller/sessions/SessionLogin.dart';
import 'package:webEconomize/custom/button.dart';
import 'package:webEconomize/domain/salario_detalhe.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1B384A),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height:20.0),
            _buildExpandableList(context),
            ButtonLabel("add um", EdgeInsets.symmetric(vertical: 8.0), EdgeInsets.symmetric(vertical: 8.0), (){
              Provider.of<SalarioController>(context, listen: false).addMaisUm(SalarioDetalhe(4, "aaa", 0.0, 0));
            })
          ],
        ),
      ),
    );
  }

  _buildExpandableList(context){
    return Consumer<SalarioController>(
      builder: (context, salarioController, child) {
        return ExpansionTile(
          backgroundColor: Color(0xff205370),
          title: Text(
            "Gastos",
            style: TextStyle(   
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
          children: <Widget>[
            Container(
              height: 200,
              color: Color(0xff141F27),
              child: ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: salarioController.listaSalarioDetalhe.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        salarioController.listaSalarioDetalhe[index].descricao,
                        style: TextStyle(   
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              )
            )
          ],
        );
      }
    ); 
  }
}