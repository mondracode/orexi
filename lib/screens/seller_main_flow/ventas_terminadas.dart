import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/seller_main_flow/components/background.dart';
import 'package:orexi/screens/seller_main_flow/components/order_history.dart';
import 'package:orexi/screens/seller_main_flow/components/orders.dart';
import 'package:orexi/screens/user_main_flow/components/search_field.dart';

class VentasTerminadas extends StatefulWidget {
  @override
  _VentasTerminadasState createState() => _VentasTerminadasState();
}

class _VentasTerminadasState extends State<VentasTerminadas> {
  static User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Ventas Terminadas",
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
        child: Container(
          padding: EdgeInsets.all(16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('reserva')
                .where('id_establecimiento', isEqualTo: user.email)
                .where('estado', isEqualTo: "Terminado")
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
                  return OrderHistory(
                    productId: doc.id,
                    productImage: 'assets/images/placeholder.png',
                    productName: doc["nombre"],
                    productPrice: doc["precio"],
                    productQuantity: doc["unidades"],
                    userName: doc.data()["cliente"],
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
}
