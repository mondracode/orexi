import 'package:flutter/material.dart';

class Favoritos extends StatefulWidget {
  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Favoritos'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: new Text('Test'),
      ),
    );
  }
}
