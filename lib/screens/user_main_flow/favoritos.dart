import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';
import 'package:orexi/screens/user_main_flow/components/search_field.dart';

class Favoritos extends StatefulWidget {
  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Favoritos",
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_alt),
            iconSize: 30,
            color: black,
            onPressed: () {},
          ),
        ],
      ),
      body: Background(
        child: Column(
          children: <Widget>[
            SearchField(
              hintText: "¿Cuál quieres visitar?",
            ),
          ],
        ),
      ),
    );
  }
}
