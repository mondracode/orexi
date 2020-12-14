import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';
import 'package:orexi/screens/user_main_flow/components/bought_product.dart';
import 'package:orexi/screens/user_main_flow/components/search_field.dart';

class Historial extends StatefulWidget {
  @override
  _HistorialState createState() => _HistorialState();
}

class _HistorialState extends State<Historial> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Historial de reservas",
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_alt),
            iconSize: 30,
            color: black,
            onPressed: () {},
          ),
        ],
      ),
      body: Background(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          children: <Widget>[
            SearchField(
              hintText: "¿Alguna reserva en especial?",
            ),
            SizedBox(height: size.height * 0.03),
            BoughtProduct(
              productImage: 'assets/images/placeholder.png',
              productName: "Tres porciones de frijoles",
              restaurantName: "Los 69 patos.com",
              productPrice: 69420,
              press: () {},
            ),
            BoughtProduct(
              productImage: 'assets/images/placeholder.png',
              productName: "Pee pee poo poo",
              restaurantName: "Esternocleidomastoideo Inc",
              productPrice: 00110110,
              press: () {},
            ),
            BoughtProduct(
              productImage: 'assets/images/placeholder.png',
              productName: "Tengo sueño",
              restaurantName: "Restaurante X",
              productPrice: 123456,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
