import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:orexi/classes/establecimiento.dart';
import 'package:orexi/classes/usuario.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/seller_main_flow/components/background.dart';

class Cuenta extends StatefulWidget {
  @override
  _CuentaState createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  static User user = FirebaseAuth.instance.currentUser;
  String userIcon = 'assets/images/placeholder.png';
  Establecimiento est;
  String userName = "Establecimiento";

  bool val = false;
  onSwitchValueChanged(bool newVal) {
    setState(() {
      val = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Mi cuenta",
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              CircleAvatar(
                radius: size.height * 0.1,
                backgroundImage: AssetImage(userIcon),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                padding: EdgeInsets.all(40.0),
                child: Text(
                  userName,
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              Text("Estado del establecimiento"),
              Switch(
                  value: val,
                  onChanged: (newVal) {
                    onSwitchValueChanged(newVal);
                  }),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                text: "MI RESTAURANTE",
                press: () {},
              ),
              RoundedButton(
                text: "HISTORIAL DE VENTAS",
                press: () {},
              ),
              RoundedButton(
                text: "PREFERENCIAS",
                press: () {},
              ),
              //Cerrar sesion
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: Colors.red[300],
                    onPressed: () async {
                      int code = await AuthSignOut();

                      switch (code) {
                        case -1:
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Phoenix.rebirth(context);
                      }
                    },
                    child: Text(
                      "CERRAR SESIÓN",
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                "Orexi",
                style: TextStyle(
                  color: superDarkGray,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool esEstablecimiento() {
    bool res = false;
    var establecimiento = FirebaseFirestore.instance
        .collection('establecimiento')
        .doc(user.email)
        .get()
        .then((doc) {
      if (doc.exists) {
        res = true;
      } else {
        res = false;
      }
    });

    return res;
  }

  Future<int> AuthSignOut() async {
    int code = -1;

    await FirebaseAuth.instance.signOut().catchError((error) {
      print(error.code);
      code = 0;
    });

    return code;
  }

  // Establecimiento buildEstablecimientoFromQuery() async {
  //   Establecimiento establecimiento;
  //   var userID = await FirebaseFirestore.instance
  //       .collection('establecimiento')
  //       .doc(user.email)
  //       .get()
  //       .then((doc) {
  //     establecimiento = Establecimiento.fromSnapshot(doc);
  //   });

  //   return establecimiento;
  // }
}
