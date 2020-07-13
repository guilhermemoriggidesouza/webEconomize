import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/LoginController.dart';
import 'package:webEconomize/controller/SalarioController.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  String nomeDoUsuario = "André Nunes";

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
        Wrap(
          direction: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                alignment: Alignment.center,        
                width: MediaQuery.of(context).size.width / 1,
                child: Text(
                  "Para usar",
                  style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,        
              width: MediaQuery.of(context).size.width / 1,
              child: _buildSalario()
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1,
              child: Wrap(
                direction: Axis.vertical,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1, 
                    child: Text(
                      "Bem vindo",
                      style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    child: Text(
                      "${Provider.of<LoginController>(context, listen: false).loginUsuario.nome}",
                       style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
                       textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1,
              child: _buildExpandableList(context),
            ),
            Container(
              height: 200,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width /1,
              child: Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.piggyBank), 
                      onPressed: (){},
                      iconSize: 60,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Wrap(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Text(
                          "Total na poupança",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        Text(
                          "2000,00", 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildSalario(){
    if( Provider.of<SalarioController>(context, listen: false,).salario.idsalario == null){
      return Text("Nenhum salário selecionado", style: TextStyle(fontSize: 25, color: Colors.white),);
    } else {
      return Wrap(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
                Icons.monetization_on,
                size: 20,
                color: Colors.white,
            ),
          ),
          Text(
            "${Provider.of<SalarioController>(context, listen: false,).salario.salarioResto}",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          Text(
            "/${Provider.of<SalarioController>(context, listen: false,).salario.salarioFixo}",
              style: TextStyle(fontSize: 15, color: Colors.white),                 
          ),
        ],
      );
    }
  }

  _buildExpandableList(context){
    return Consumer<SalarioController>(
      builder: (context, salarioController, child) {
        return Container(
          color: Color(0xff018ac0),
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          padding: const EdgeInsets.all(2.0),
          child: ExpansionTile(
            backgroundColor: Color(0xff018ac0),
            title: Text(
              "Gastos",
              style: TextStyle(   
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 2.0, left: 2.0, right: 2.0),
                child: Container(
                  color: Color(0xff141F27),
                  child: ListView.separated(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: salarioController.listaSalarioDetalhe.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: _buildPaddingList(index),
                        child: Container(
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
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(color: Color(0xff205370),),
                  )
                ),
              )
            ],
          ),
        );
      }
    ); 
  }

  _buildPaddingList(int len){
    if(len == 0){
      return EdgeInsets.only(top: 15);
    }else{
       return EdgeInsets.only(bottom: 15);
    } 
  }
}