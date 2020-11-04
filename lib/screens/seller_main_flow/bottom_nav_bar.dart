import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';

import 'cuenta.dart';
import 'pedidos.dart';
import 'publicaciones.dart';


class SellerBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<SellerBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Publicaciones(),
    Pedidos(),
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
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        print(user.email);
      }
    });

  


    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTappedBar,
        //elevation: 50,
        backgroundColor: white,
        iconSize: 30,
        selectedItemColor: green,
        unselectedItemColor: darkGray,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.article_rounded),
            label: 'Publicaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.beenhere_rounded),
            label: 'Pedidos',
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
