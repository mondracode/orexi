import 'package:flutter/material.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/seller_main_flow/components/background.dart';

class Cuenta extends StatefulWidget {
  @override
  _CuentaState createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  String userIcon = 'assets/images/placeholder.png';
  String userName = 'Crepes & Waffles';

  bool val = false;
  onSwitchValueChanged(bool newVal) {
    setState(() {
      val = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Mi cuenta",
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              CircleAvatar(
                radius: size.height * 0.1,
                backgroundImage: AssetImage(userIcon),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                userName,
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              Text("Estado del establecimiento"),
              Switch(
                  value: val,
                  onChanged: (newVal) {
                    onSwitchValueChanged(newVal);
                  }),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                text: "MI RESTAURANTE",
                press: () {},
              ),
              RoundedButton(
                text: "HISTORIAL DE VENTAS",
                press: () {},
              ),
              RoundedButton(
                text: "PREFERENCIAS",
                press: () {},
              ),
              //Cerrar sesion
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: Colors.red[300],
                    onPressed: () {},
                    child: Text(
                      "CERRAR SESIÓN",
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                "Orexi",
                style: TextStyle(
                  color: superDarkGray,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
