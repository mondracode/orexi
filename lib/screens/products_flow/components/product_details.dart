import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orexi/components/already_have_account.dart';
import 'package:orexi/components/input_field.dart';
import 'package:orexi/screens/signup/components/choose_button.dart';
import 'package:orexi/components/password_field.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/screens/login/login_screen.dart';
import 'package:orexi/screens/seller_main_flow/bottom_nav_bar.dart';
import 'package:orexi/screens/welcome/components/background.dart';
import 'package:orexi/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String nombre;
  String descripcion;
  int precio, unidades;
  File image;
  String imageURL = 'assets/images/placeholder.png';
  static User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    String porciones;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.1),
        child: AppBar(
          backgroundColor: white,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: black,
          ),
          elevation: 0,
          title: Text(
            "Publica un producto",
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            ),
          ),
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ChooseButton(
                press: uploadImage,
                img: Image.asset('assets/images/placeholder.png'),
              ),
              InputField(
                hintText: "Nombre del producto",
                //icon: IconData(58840),
                onChanged: (value) {
                  nombre = value;
                },
              ),
              Container(
                  child: descripcion == null
                      ? Text(
                          "El producto debe tener un nombre",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      : SizedBox(height: 0)),
              InputField(
                hintText: "Descripción",
                onChanged: (value) {
                  descripcion = value;
                },
              ),
              InputField(
                hintText: "Precio",
                onChanged: (value) {
                  precio = int.parse(value);
                },
              ),
              InputField(
                hintText: "Cantidad",
                onChanged: (value) {
                  unidades = int.parse(value);
                },
              ),
              Container(
                  child: descripcion == null
                      ? Text(
                          "El producto debe tener un precio",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      : SizedBox(height: 0)),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                  text: "Publicar",
                  press: () async {
                    //excepciones para publicar
                    FirebaseFirestore.instance.collection('producto').add({
                      'nombre': nombre,
                      'descripcion': descripcion,
                      'precio': precio,
                      'id_establecimiento': user.email,
                      'descuento': 0,
                      'distancia': 555,
                      'unidades': unidades
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SellerBottomNavigationBar();
                        },
                      ),
                    );
                    //return PantallaDeVendedor();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  uploadImage() async {}
}
