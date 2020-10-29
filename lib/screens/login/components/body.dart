import 'package:flutter/material.dart';
import 'package:orexi/components/already_have_account.dart';
import 'package:orexi/components/input_field.dart';
import 'package:orexi/components/password_field.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/screens/signup/signup_choose.dart';
import 'package:orexi/screens/welcome/components/background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            InputField(
              hintText: "E-mail",
              onChanged: (value) {},
            ),
            PasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "INICIAR SESIÓN",
              press: () {},
            ),
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
    );
  }
}
