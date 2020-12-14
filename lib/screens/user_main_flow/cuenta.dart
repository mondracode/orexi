import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';
import 'package:orexi/screens/user_main_flow/historial_reservas.dart';
import 'package:orexi/screens/user_main_flow/reportar.dart';

class Cuenta extends StatefulWidget {
  @override
  _CuentaState createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  static User user = FirebaseAuth.instance.currentUser;
  String userIcon = 'assets/images/placeholder.png';
  // Comentado mientras tanto porque no hay email
  String userName;

  @override
  Widget build(BuildContext context) {
    user = FirebaseAuth.instance.currentUser;
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
                  //userName,
                  user.email,
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                text: "MIS DATOS",
                press: () {},
              ),
              RoundedButton(
                text: "HISTORIAL DE RESERVAS",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Historial()));
                },
              ),
              RoundedButton(
                text: "AYUDA",
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Reportar()));
                },
              ),
              RoundedButton(
                text: "PREFERENCIAS",
                press: () {
                  print(user.email);
                },
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
                      int code = await authSignOut();

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
              SizedBox(height: size.height * 0.01),
            ],
          ),
        ),
      ),
    );
  }

  Future<int> authSignOut() async {
    int code = -1;

    await FirebaseAuth.instance.signOut().catchError((error) {
      print(error.code);
      code = 0;
    });

    return code;
  }
}
