import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/LoginController.dart';
import 'package:webEconomize/controller/SalarioController.dart';
import 'package:webEconomize/custom/buttonIcon.dart';
import 'package:webEconomize/custom/exit.dart';
import 'package:webEconomize/custom/metas.dart';
import 'package:webEconomize/custom/poupanca.dart';
import 'package:webEconomize/custom/power.dart';
import 'package:webEconomize/view/home.dart';
import 'package:webEconomize/view/metas.dart';
import 'package:webEconomize/view/mov_saida.dart';
import 'package:webEconomize/view/Login.dart';
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
    return _buildScreen();
  }

  _buildScreen(){
    return Consumer<LoginController>(
      builder: (context, loginController, child) {
        if(loginController.loginUsuario != null){
          return Scaffold(
            appBar: _buildAppBar(),
            bottomNavigationBar: _buildBottomNav(),
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          );
        }else{
          return Scaffold(
            backgroundColor: Color(0xff141F27),
            body: Center(
              child: Login()
            ),
          );
        }
      },
    );    
  }

  _buildBottomNav(){
    return BottomNavigationBar(
      backgroundColor: Color(0xff141F27),
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        _buildBottomNavItem(Icons.home, 'Início'),
        _buildBottomNavItem(Exit.icon_ionic_md_exit, 'Mov Saida'),
        _buildBottomNavItem(Icons.attach_money, 'Salario'),
        _buildBottomNavItem(MetasIcons.album, 'Metas'),
        _buildBottomNavItem(PoupancaIcons.account_balance, 'Poupanca'),
        
      ],

      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
  
  BottomNavigationBarItem _buildBottomNavItem(icon, text){
    return BottomNavigationBarItem(
      icon: Icon(icon, color: Colors.white30),
      activeIcon: Icon(icon, color: Colors.white),
      backgroundColor: Color(0xff141F27),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.white
        )
      ),
    );
  }

  _buildAppBar(){
    return AppBar(
      title: _buildNomeUser(), 
      backgroundColor: Color(0xff142129),
      actions: <Widget>[
        ButtonIcon(Icon(Power.icon_awesome_power_off, color: Colors.white,), (){
          Provider.of<SalarioController>(context, listen: false).limparSalario();
          Provider.of<LoginController>(context, listen: false).limparLogin();
        } , label: "Sair")
      ],
    );
  }

  _buildNomeUser(){
    return Consumer<LoginController>(
      builder: (context, loginController, child) {
        return Text(
          loginController.loginUsuario.nome,
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
