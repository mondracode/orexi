//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    //Query query = FirebaseFirestore.instance.collection('establecimiento');

    // FirebaseFirestore.instance
    //     .collection('establecimiento')
    //     .where('telefono', isEqualTo: "4206969")
    //     .snapshots()
    //     .listen(
    //   (data) {
    //     print('Nombre: ${data.docs[0]['nombre']}');
    //     print('Direccion: ${data.docs[0]['direccion']}');
    //     print('Telefono: ${data.docs[0]['telefono']}');
    //   },
    // );
    return Scaffold(
      body: Body(),
    );
  }
}
