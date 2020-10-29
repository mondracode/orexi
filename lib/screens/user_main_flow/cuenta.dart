import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';

class Cuenta extends StatefulWidget {
  @override
  _CuentaState createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        // iconTheme: IconThemeData(
        //   color: black,
        // ),
        elevation: 0,
        title: Text(
          "Mi cuenta",
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
      ),
      body: Background(
        child: Center(
          child: Text('Test'),
        ),
      ),
    );
  }
}
