import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orexi/components/input_field.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';

class MiRestaurante extends StatefulWidget {
  @override
  _MiRestauranteState createState() => _MiRestauranteState();
}

class _MiRestauranteState extends State<MiRestaurante> {
  String newName;
  String newAddress;
  static User user = FirebaseAuth.instance.currentUser;
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
              InputField(
                hintText: "Nueva dirección",
                onChanged: (value) {
                  newAddress = value;
                },
              ),
              RoundedButton(
                text: "Actualizar cuenta",
                // actualizar base de datos
                press: () async {
                  if (newName != null && newName != "") {
                    await FirebaseAuth.instance.currentUser
                        .updateProfile(displayName: newName)
                        .then((value) =>
                            FirebaseAuth.instance.currentUser.reload());
                  }
                  if (newAddress != null && newAddress != "") {
                    await FirebaseFirestore.instance
                        .collection('establecimiento')
                        .doc(user.email)
                        .update({'direccion': newAddress});
                  }

                  Navigator.pop(context);
                },
              ),
              Text(
                "El cambio se verá reflejado en el siguiente inicio de sesión",
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
