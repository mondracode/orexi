import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final bool login;
  final Function press;

  const AlreadyHaveAccount({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "¿NO TIENES CUENTA? " : "¿YA TIENES CUENTA? ",
          //style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "REGÍSTRATE" : "INICIAR SESIÓN",
            style: TextStyle(
              color: green,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
