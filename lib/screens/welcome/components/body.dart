import 'package:flutter/material.dart';
import 'package:orexi/components/already_have_account.dart';
import 'package:orexi/screens/signup/signup_choose.dart';
import 'package:orexi/screens/welcome/components/background.dart';
import 'package:orexi/screens/login/login_screen.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome",
            ),
            RoundedButton(
              text: "CREAR CUENTA",
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
    );
  }
}
