import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/seller_main_flow/components/background.dart';
import 'package:orexi/screens/seller_main_flow/components/orders.dart';
import 'package:orexi/screens/user_main_flow/components/search_field.dart';


class Pedidos extends StatefulWidget {
  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Pedidos",
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
      ),
      body: Background(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          children: <Widget>[
           
           SearchField(
              hintText: "Encuentra un pedido",
            ), 

            SizedBox(height: size.height * 0.03),
            NearProduct(
              productImage: 'assets/images/placeholder.png',
              productName: "Dos porciones de arroz",
              userName: "Laura Sánchez",
              productPrice: 8000,
              press: () {},
            ),
            NearProduct(
              productImage: 'assets/images/placeholder.png',
              productName: "Tres alas de pollo",
              userName: "Jorge Gómez",
              productPrice: 9500,
              press: () {},
            ),
            NearProduct(
              productImage: 'assets/images/placeholder.png',
              productName: "Seis panes hojaldrados",
              userName: "Nicol García",
              productPrice: 2500,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
