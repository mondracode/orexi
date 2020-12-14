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
          children: [
            Container(
              height: (size.height * 0.5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              height: (size.height * 0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Hagamos un cambio",
                    style: TextStyle(
                      color: black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    width: (size.width * 0.8),
                    child: Text(
                      "Miles de toneladas de comida son desperdiciadas al año",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: black,
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
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
          ],
        ),
      ),
    );
  }
}
