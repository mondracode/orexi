import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orexi/components/input_field.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';

class EditarPublicacion extends StatefulWidget {
  @override
  _EditarPublicacionState createState() => _EditarPublicacionState();
}

class _EditarPublicacionState extends State<EditarPublicacion> {
  String newName;
  String newDesc;
  int newPrice;
  int newQuantity;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Editar publicación",
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
              InputField(
                hintText: "Nueva descripción",
                onChanged: (value) {
                  newDesc = value;
                },
              ),
              InputField(
                hintText: "Nuevo precio",
                onChanged: (value) {
                  newPrice = int.parse(value);
                },
              ),
              InputField(
                hintText: "Nueva cantidad",
                onChanged: (value) {
                  newQuantity = int.parse(value);
                },
              ),
              RoundedButton(
                text: "Actualizar producto",
                // actualizar base de datos
                press: () {},
              ),
              Text(
                "El cambio se verá reflejado cuando los CERDOS VUELEN",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
