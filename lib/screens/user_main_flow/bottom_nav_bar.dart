import 'package:flutter/material.dart';

import 'cerca.dart';
import 'favoritos.dart';
import 'ofertas.dart';
import 'cuenta.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Cerca(),
    Ofertas(),
    Favoritos(),
    Cuenta(),
  ];

  // change tab
  void _onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTappedBar,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Cerca a ti',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bolt),
            label: 'Ofertas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Cuenta',
          ),
        ],
        selectedItemColor: Colors.green[400],
        unselectedItemColor: Colors.blueGrey[100],
      ),
    );
  }
}
