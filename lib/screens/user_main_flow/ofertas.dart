import 'package:flutter/material.dart';

class Ofertas extends StatefulWidget {
  @override
  _OfertasState createState() => _OfertasState();
}

class _OfertasState extends State<Ofertas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Ofertas'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: new Text('Test'),
      ),
    );
  }
}
