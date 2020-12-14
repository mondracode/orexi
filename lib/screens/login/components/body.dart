import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orexi/classes/establecimiento.dart';
import 'package:orexi/components/already_have_account.dart';
import 'package:orexi/components/input_field.dart';
import 'package:orexi/components/password_field.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/seller_main_flow/bottom_nav_bar.dart';
import 'package:orexi/screens/signup/signup_choose.dart';
import 'package:orexi/screens/user_main_flow/bottom_nav_bar.dart';
import 'package:orexi/screens/welcome/components/background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // const Body({
  //   Key key,
  // }) : super(key: key);
  String authEmail;
  String authPassword;
  bool userNotFound = false;
  bool wrongPassword = false;

  @override
  Widget build(BuildContext context) {
    authEmail = "";
    authPassword = "";
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.1),
        child: AppBar(
          backgroundColor: gray,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: black,
          ),
          elevation: 0,
          title: Text(
            "¡Bienvenido!",
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
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
                hintText: "E-mail",
                onChanged: (value) {
                  authEmail = value;
                },
              ),
              Container(
                  child: userNotFound
                      ? Text(
                          "Usuario no encontrado",
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
                  child: wrongPassword
                      ? Text(
                          "La contraseña es incorrecta",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      : SizedBox(height: 0)),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                text: "INICIAR SESIÓN",
                press: () async {
                  int errorCode =
                      await authLogin(authEmail, authPassword, context);
                  print(authEmail);

                  switch (errorCode) {
                    case 0:
                      setState(() {
                        userNotFound = true;
                      });
                      break;
                    case 1:
                      setState(() {
                        wrongPassword = true;
                      });
                      break;
                    case -1:
                      bool establecimiento = await FirebaseFirestore.instance
                          .collection('establecimiento')
                          .doc(authEmail)
                          .get()
                          .then((doc) {
                        if (doc.exists) {
                          return true;
                        } else {
                          return false;
                        }
                      });

                      if (establecimiento) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SellerBottomNavigationBar();
                            },
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyBottomNavigationBar();
                            },
                          ),
                        );
                      }
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAccount(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignupSelect();
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

  Future<int> authLogin(String authEmail, String authPassword, context) async {
    int code = -1;
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: authEmail, password: authPassword)
        .catchError((error) {
      print(error.message);
      if (error.code == 'user-not-found') {
        code = 0;
      } else if (error.code == 'wrong-password') {
        code = 1;
      }
    });

    return code;
  }
}
