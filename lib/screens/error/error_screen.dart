import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Text(
        "Esto debería ser una pantalla de error",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
        ),
      ),
    ));
  }
}
