import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';
import 'package:orexi/screens/user_main_flow/components/search_field.dart';

class Cerca extends StatefulWidget {
  @override
  _CercaState createState() => _CercaState();
}

class _CercaState extends State<Cerca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Cerca a ti",
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
              hintText: "¿Qué quieres comer?",
            ),
          ],
        ),
      ),
    );
  }
}
