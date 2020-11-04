import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/products_flow/agregar_productos.dart';
import 'package:orexi/screens/seller_main_flow/components/background.dart';
import 'package:orexi/screens/seller_main_flow/components/publications.dart';
import 'package:orexi/screens/user_main_flow/components/search_field.dart';


class Publicaciones extends StatefulWidget {
  @override
  _PublicacionesState createState() => _PublicacionesState();
}

class _PublicacionesState extends State<Publicaciones> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Tus Publicaciones",
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
              hintText: "Buscas entre tus publicaciones?",
            ),
            
            SizedBox(height: size.height * 0.03),
            NearProduct(
              productImage: 'assets/images/placeholder.png',
              productName: "Dos porciones de arroz",
              productDesc: "Dos porciones de 60gr de arroz blanco y fideos",
              productPrice: 8000,
              
              press: () {},
            ),
            NearProduct(
              productImage: 'assets/images/placeholder.png',
              productName: "Tres alas de pollo",
              productDesc: "Tres allas de pollo a la broaster",
              productPrice: 9500,
              
              press: () {},
            ),
            NearProduct(
              productImage: 'assets/images/placeholder.png',
              productName: "Seis panes hojaldrados",
              productDesc: "Seis panes holaldrados horneados hoy en la mañana",
              productPrice: 2500,
              
              press: () {},
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
             return AgregarProductos();
            },
          ),
        );                   
      },
      child: Icon(Icons.add_rounded),
      backgroundColor: Colors.green,
    ),

    );
  }
}
