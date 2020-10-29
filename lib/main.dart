import 'package:flutter/material.dart';
import 'package:orexi/screens/welcome/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orexi',
      theme: ThemeData(fontFamily: 'OpenSans'),
      home: Welcome(),
    );
  }
}
