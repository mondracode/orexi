import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';

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
    // FirebaseAuth.instance.authStateChanges().listen((User user) {
    //   if (user == null) {
    //     print('User is currently signed out!');
    //   } else {
    //     print('User is signed in!');
    //     print(user.email);
    //   }
    // });

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTappedBar,
        //elevation: 50,
        backgroundColor: black,
        iconSize: 30,
        selectedItemColor: green,
        unselectedItemColor: darkGray,
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
      ),
    );
  }
}
