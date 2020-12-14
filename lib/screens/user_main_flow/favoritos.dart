import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';
import 'package:orexi/screens/user_main_flow/components/fav_restaurant.dart';
import 'package:orexi/screens/user_main_flow/components/search_field.dart';

class Favoritos extends StatefulWidget {
  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Tendencias",
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
                .collection('establecimiento')
                .orderBy('num_ventas', descending: true)
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
                  return FavoriteRestaurant(
                    restaurantImage: 'assets/images/placeholder.png',
                    restaurantName: doc['nombre'],
                    restaurantAddress: doc['direccion'],
                    restaurantRating: doc['num_ventas'],
                    press: () {},
                  );
                }).toList(),
              );
            },
          ),
        ),
        // child: ListView(
        //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        //   children: <Widget>[
        //     SearchField(
        //       hintText: "¿Qué quieres comer?",
        //     ),
        //     SizedBox(height: size.height * 0.03),
        //     FavoriteRestaurant(
        //       restaurantImage: "assets/images/placeholder.png",
        //       restaurantName: "Esquina Las Delicias",
        //       restaurantAddress: "Cra. 13 # 15-98",
        //       restaurantRating: 8.7,
        //       press: () {},
        //     ),
        //     FavoriteRestaurant(
        //       restaurantImage: "assets/images/placeholder.png",
        //       restaurantName: "Crepes and Waffles",
        //       restaurantAddress: "Cll. 49 # 24-74",
        //       restaurantRating: 9.6,
        //       press: () {},
        //     ),
        //     FavoriteRestaurant(
        //       restaurantImage: "assets/images/placeholder.png",
        //       restaurantName: "Piqueteadero de Don Pedro",
        //       restaurantAddress: "Cll. 1 # 69-96",
        //       restaurantRating: 7.2,
        //       press: () {},
        //     ),
        //     FavoriteRestaurant(
        //       restaurantImage: "assets/images/placeholder.png",
        //       restaurantName: "Lestaulante El Chino",
        //       restaurantAddress: "Cra. 5 # 11-21",
        //       restaurantRating: 5.4,
        //       press: () {},
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
