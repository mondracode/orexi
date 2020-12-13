import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orexi/classes/establecimiento.dart';
import 'package:orexi/components/already_have_account.dart';
import 'package:orexi/components/input_field.dart';
import 'package:orexi/components/password_field.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/screens/login/login_screen.dart';
import 'package:orexi/screens/seller_main_flow/bottom_nav_bar.dart';
import 'package:orexi/screens/welcome/components/background.dart';
import 'package:orexi/constants.dart';

class BodySeller extends StatefulWidget {
  @override
  _BodySellerState createState() => _BodySellerState();
}

class _BodySellerState extends State<BodySeller> {
  String authEmail;
  String authPassword;
  String nombreEstablecimiento;
  String direccionEstablecimiento;
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
                hintText: "Nombre del establecimiento",
                //icon: IconData(58840),
                onChanged: (value) {
                  nombreEstablecimiento = value;
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
              InputField(
                hintText: "Dirección del establecimiento",
                onChanged: (value) {
                  direccionEstablecimiento = value;
                },
              ),
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
                text: "COMENZAR A VENDER",
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
                          .collection('establecimiento')
                          .doc(authEmail)
                          .set({
                        'nombre': nombreEstablecimiento,
                        'direccion': direccionEstablecimiento,
                        'telefono': "4206969"
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SellerBottomNavigationBar();
                          },
                        ),
                      );
                    //return PantallaDeVendedor();
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
}

// Future<int> authSignUp(String authEmail, String authPassword, context) async {
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance
//         .createUserWithEmailAndPassword(
//             email: authEmail, password: authPassword);
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//       return 0;
//     } else if (e.code == 'email-already-in-use') {
//       return 1;
//     }
//   } catch (e) {
//     print(e);
//   }
//   return -1;
// }

Future<int> authSignUp(String authEmail, String authPassword, context) async {
  int code = -1;
  UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: authEmail, password: authPassword)
      .catchError((error) {
    if (error.code == 'weak-password') {
      code = 0;
    } else if (error.code == 'email-already-in-use') {
      code = 1;
    }
  });

  return code;
}
