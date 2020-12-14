import 'package:flutter/material.dart';
import 'package:orexi/components/input_field.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';

class MisDatos extends StatefulWidget {
  @override
  _MisDatosState createState() => _MisDatosState();
}

class _MisDatosState extends State<MisDatos> {
  String newName;
  // newPhoto
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Editar datos",
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputField(
                hintText: "Nuevo nombre",
                onChanged: (value) {
                  newName = value;
                },
              ),
              RoundedButton(
                text: "Actualizar cuenta",
                // actualizar base de datos
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
