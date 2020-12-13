import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';

class Reportar extends StatefulWidget {
  @override
  _ReportarState createState() => _ReportarState();
}

class _ReportarState extends State<Reportar> {
  // Para controlar el contenido del TextField
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Reportar producto",
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
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "La información ingresada será revisada por un moderador. " +
                      "Por favor sé conciso y describe los detalles importantes.",
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  autofocus: true,
                  maxLength: 500,
                  maxLines: null,
                  controller: myController,
                  decoration: InputDecoration(
                    labelText: 'Descripción del incidente',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: green),
                    ),
                    labelStyle: TextStyle(color: black),
                  ),
                ),
              ),
              RoundedButton(
                text: "Enviar reporte",
                press: () {
                  // Enviar texto a algun lado xd
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
