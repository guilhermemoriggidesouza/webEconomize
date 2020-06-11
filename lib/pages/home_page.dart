
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
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
    return AppBar(
      title: Text('PA',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
      backgroundColor: Colors.black26,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.attach_money),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.info),
          onPressed: (){},
        )
      ],
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
