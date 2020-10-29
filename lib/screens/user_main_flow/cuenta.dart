import 'package:flutter/material.dart';

class Cuenta extends StatefulWidget {
  @override
  _CuentaState createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Cuenta'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: new Text('Test'),
      ),
    );
  }
}
