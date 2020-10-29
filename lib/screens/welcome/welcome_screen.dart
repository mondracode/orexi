import 'package:cloud_firestore/cloud_firestore.dart';
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
    //query = query.where('telefono', isEqualTo: "4206969");
    //print(query);

    return Scaffold(
      body: Body(),
    );
  }
}
