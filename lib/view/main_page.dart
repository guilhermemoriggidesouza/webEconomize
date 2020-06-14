import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/LoginController.dart';
import 'package:webEconomize/controller/sessions/SessionLogin.dart';
import 'package:webEconomize/custom/exit.dart';
import 'package:webEconomize/custom/metas.dart';
import 'package:webEconomize/custom/poupanca.dart';
import 'package:webEconomize/custom/power.dart';
import 'package:webEconomize/view/home.dart';
import 'package:webEconomize/view/metas.dart';
import 'package:webEconomize/view/mov_saida.dart';
import 'package:webEconomize/view/poupanca.dart';
import 'package:webEconomize/view/salario.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    MovSaida(),
    Salario(),
    Metas(),
    Poupanca(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff141F27),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white30),
            activeIcon: Icon(Icons.home, color: Colors.white),
            backgroundColor: Color(0xff141F27),
            title: Text(
              'Início',
              style: TextStyle(
                color: Colors.white
              )
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(Exit.icon_ionic_md_exit, color: Colors.white30),
            activeIcon: Icon(Exit.icon_ionic_md_exit, color: Colors.white),
            backgroundColor: Color(0xff141F27),
            title: Text(
              'Mov Saida',
              style: TextStyle(
                color: Colors.white
              )
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money, color: Colors.white30),
            activeIcon: Icon(Icons.attach_money, color: Colors.white),
            backgroundColor: Color(0xff141F27),
            title: Text(
              'Salario',
              style: TextStyle(
                color: Colors.white
              )
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(MetasIcons.album, color: Colors.white30),
            activeIcon: Icon(MetasIcons.album, color: Colors.white),
            backgroundColor: Color(0xff141F27),
            title: Text(
              'Metas',
              style: TextStyle(
                color: Colors.white
              )
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(PoupancaIcons.account_balance, color: Colors.white30),
            activeIcon: Icon(PoupancaIcons.account_balance, color: Colors.white),
            backgroundColor: Color(0xff141F27),
            title: Text(
              'Poupanca',
              style: TextStyle(
                color: Colors.white
              )
            ),
          ),
        
        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  _buildAppBar(){
    LoginController logingController = LoginController();
    logingController.mudarNomeSessaoLogin(context); 
    
    return AppBar(
      title: _buildNomeUser(), 
      backgroundColor: Color(0xff142129),
      actions: <Widget>[
        Container(
          child: FlatButton(
            onPressed: () => {},
            child: Row( // Replace with a Row for horizontal icon + text                  
              children: <Widget>[
                Icon(Power.icon_awesome_power_off, color: Colors.white,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child:  Text(
                    "Sair",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildNomeUser(){
    return Consumer<SessionLogin>(
      builder: (context, sessionLogin, child) {
        return Text(
          sessionLogin.nome,
          style: TextStyle(
            color: Colors.white,
          ),
        );
      },
    );
  }

  _buildText(String title, {double top = 16.0, double bottom = 8.0}){
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

}
