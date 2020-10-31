import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';
import 'package:orexi/screens/user_main_flow/components/discount_product.dart';
import 'package:orexi/screens/user_main_flow/components/search_field.dart';

class Ofertas extends StatefulWidget {
  @override
  _OfertasState createState() => _OfertasState();
}

class _OfertasState extends State<Ofertas> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Ofertas relámpago",
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
              hintText: "¿Qué quieres comer?",
            ),
            SizedBox(height: size.height * 0.03),
            DiscountProduct(
              productImage: 'assets/images/placeholder.png',
              productName: "Tres porciones de frijoles",
              productDesc: "Tres porciones de 50gr de frijoles negros",
              productFormerPrice: 8000,
              productCurrentPrice: 6500,
              productDistance: 14,
              press: () {},
            ),
            DiscountProduct(
              productImage: 'assets/images/placeholder.png',
              productName: "2 libras de carne de res",
              productDesc: "2 libras de carne de res a término bien asado",
              productFormerPrice: 6900,
              productCurrentPrice: 5200,
              productDistance: 420,
              press: () {},
            ),
            DiscountProduct(
              productImage: 'assets/images/placeholder.png',
              productName: "Una porción de sopa de arroz",
              productDesc: "Un plato de 60oz de sopa de arroz con menudencias",
              productFormerPrice: 7300,
              productCurrentPrice: 6100,
              productDistance: 69,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
