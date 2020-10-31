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

class BodyClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String authEmail;
    String authPassword;
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
                hintText: "Usuario",
                onChanged: (value) {},
              ),
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
                text: "COMENZAR A COMPRAR",
                press: () {
                  authSignUp(authEmail, authPassword);

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

  Future<void> authSignUp(String authEmail, String authPassword) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: authEmail, password: authPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
