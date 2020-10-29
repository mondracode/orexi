import 'package:flutter/material.dart';
import 'package:orexi/components/already_have_account.dart';
import 'package:orexi/components/input_field.dart';
import 'package:orexi/components/password_field.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/screens/login/login_screen.dart';
import 'package:orexi/screens/user_main_flow/bottom_nav_bar.dart';
import 'package:orexi/screens/welcome/components/background.dart';

class BodyClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "CREAR CUENTA CLIENTE",
            ),
            InputField(
              hintText: "Usuario",
              onChanged: (value) {},
            ),
            InputField(
              hintText: "E-mail",
              onChanged: (value) {},
            ),
            PasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "COMENZAR A COMPRAR",
              press: () {
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
