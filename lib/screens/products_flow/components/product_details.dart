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

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String nombre;
  String porciones;
  String precio;
  String image= 'assets/images/placeholder.png';

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
                press: () {
                  //Cambiar imagen
                },
                img: Image.asset('assets/images/placeholder.png'),
              ),



              InputField(
                hintText: "Nombre del producto",
                //icon: IconData(58840),
                onChanged: (value) {
                  nombre = value;
                },
              ),
              InputField(
                hintText: "Porciones",
                onChanged: (value) {
                  porciones = value;
                },
              ),
              
              InputField(
                hintText: "Precio",
                onChanged: (value) {
                  precio= value;
                },
              ),
              
             
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                text: "Publicar",
                press: () async { 
                        //excepciones para publicar 
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SellerBottomNavigationBar();
                          },
                        ),
                      );
                    //return PantallaDeVendedor();
                  }
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}