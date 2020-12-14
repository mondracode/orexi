import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orexi/classes/producto.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';
import 'package:orexi/screens/user_main_flow/components/near_product.dart';
import 'package:orexi/screens/user_main_flow/components/search_field.dart';

class Cerca extends StatefulWidget {
  @override
  _CercaState createState() => _CercaState();
}

class _CercaState extends State<Cerca> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Cerca a ti",
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
        child: Container(
          padding: EdgeInsets.all(16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('producto')
                .limit(20)
                .orderBy('distancia', descending: false)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data.docs.map((DocumentSnapshot doc) {
                  return NearProduct(
                    productImage: 'assets/images/placeholder.png',
                    productName: doc["nombre"],
                    productDesc: doc["descripcion"],
                    productPrice: doc["precio"],
                    productDistance: doc["distancia"],
                    productQuantity: doc["unidades"],
                    press: () {},
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }

  Stream<QuerySnapshot> loadNearProducts() {
    return FirebaseFirestore.instance
        .collection('establecimiento/producto')
        .orderBy('distancia', descending: false)
        .limit(20)
        .snapshots();
  }

  List<Producto> getProductsFromQuery(QuerySnapshot snapshot) {
    return snapshot.docs.map((DocumentSnapshot doc) {}).toList();
  }
}
