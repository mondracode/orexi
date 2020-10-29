import 'package:flutter/material.dart';

class Cerca extends StatefulWidget {
  @override
  _CercaState createState() => _CercaState();
}

class _CercaState extends State<Cerca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Cerca a ti'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: new Text('Test'),
      ),
    );
  }
}
