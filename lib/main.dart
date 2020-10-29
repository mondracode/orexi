import 'package:flutter/material.dart';
import 'package:orexi/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
