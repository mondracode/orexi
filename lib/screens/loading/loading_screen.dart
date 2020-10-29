import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Text(
        "Esto debería ser una pantalla de carga",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
        ),
      ),
    ));
  }
}
