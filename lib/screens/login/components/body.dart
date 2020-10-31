import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orexi/components/already_have_account.dart';
import 'package:orexi/components/input_field.dart';
import 'package:orexi/components/password_field.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/signup/signup_choose.dart';
import 'package:orexi/screens/user_main_flow/bottom_nav_bar.dart';
import 'package:orexi/screens/welcome/components/background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String authEmail;
    String authPassword;
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
              PasswordField(
                onChanged: (value) {
                  authPassword = value;
                },
              ),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                text: "INICIAR SESIÓN",
                press: () {
                  authLogin(authEmail, authPassword);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MyBottomNavigationBar();
                      },
                    ),
                  );
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

  Future<void> authLogin(String authEmail, String authPassword) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: authEmail, password: authPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
