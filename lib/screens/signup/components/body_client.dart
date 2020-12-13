import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orexi/components/already_have_account.dart';
import 'package:orexi/components/input_field.dart';
import 'package:orexi/components/password_field.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/screens/login/login_screen.dart';
import 'package:orexi/screens/user_main_flow/bottom_nav_bar.dart';
import 'package:orexi/screens/welcome/components/background.dart';
import 'package:orexi/constants.dart';

class BodyClient extends StatefulWidget {
  @override
  _BodyClientState createState() => _BodyClientState();
}

class _BodyClientState extends State<BodyClient> {
  String authEmail;
  String authPassword;
  String nombreCliente;
  bool weakPassword = false;
  bool emailInUse = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.1),
        child: AppBar(
          backgroundColor: white,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: black,
          ),
          elevation: 0,
          title: Text(
            "¡Solo un paso más!",
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.bold,
              fontSize: 26.0,
            ),
          ),
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputField(
                hintText: "Nombre",
                onChanged: (value) {
                  nombreCliente = value;
                },
              ),
              InputField(
                hintText: "E-mail",
                onChanged: (value) {
                  authEmail = value;
                },
              ),
              Container(
                  child: emailInUse
                      ? Text(
                          "Esa dirección de correo ya se encuentra en uso",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      : SizedBox(height: 0)),
              PasswordField(
                onChanged: (value) {
                  authPassword = value;
                },
              ),
              Container(
                  child: weakPassword
                      ? Text(
                          "Esa contraseña es muy débil",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      : SizedBox(height: 0)),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                text: "COMENZAR A COMPRAR",
                press: () async {
                  int errorCode =
                      await authSignUp(authEmail, authPassword, context);
                  //print(errorCode);
                  switch (errorCode) {
                    case 0:
                      setState(() {
                        weakPassword = true;
                      });
                      break;

                    case 1:
                      setState(() {
                        emailInUse = true;
                      });
                      break;

                    case -1: //succesful login

                      FirebaseFirestore.instance
                          .collection('usuario')
                          .doc(authEmail)
                          .set({
                        'nombre': nombreCliente,
                        //'direccion': direccionEstablecimiento
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyBottomNavigationBar();
                          },
                        ),
                      );
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAccount(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<int> authSignUp(String authEmail, String authPassword, context) async {
    int code = -1;
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: authEmail, password: authPassword)
        .catchError((error) {
      if (error.code == 'weak-password') {
        code = 0;
      } else if (error.code == 'email-already-in-use') {
        code = 1;
      }
    });

    return code;
  }
}
