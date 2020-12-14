import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/products_flow/agregar_productos.dart';
import 'package:orexi/screens/seller_main_flow/components/background.dart';
import 'package:orexi/screens/seller_main_flow/components/publications.dart';
import 'package:orexi/screens/seller_main_flow/editar_publicacion.dart';
import 'package:orexi/screens/user_main_flow/components/search_field.dart';

class Publicaciones extends StatefulWidget {
  @override
  _PublicacionesState createState() => _PublicacionesState();
}

class _PublicacionesState extends State<Publicaciones> {
  static User user = FirebaseAuth.instance.currentUser;
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
        child: Container(
          padding: EdgeInsets.all(16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('producto')
                .where('id_establecimiento', isEqualTo: user.email)
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
                  String _tempId = doc.id;
                  return Publications(
                    productId: doc.id,
                    productImage: 'assets/images/placeholder.png',
                    productName: doc["nombre"],
                    productDesc: doc["descripcion"],
                    productPrice: doc["precio"],
                    productQuantity: doc["unidades"],
                    editarBoton: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditarPublicacion(
                                    pubId: doc.id,
                                  )));
                    },
                    eliminarBoton: () {
                      showAlertDialog(context, doc.id);
                    },
                  );
                }).toList(),
              );
            },
          ),
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

showAlertDialog(BuildContext context, String id) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    color: green,
    child: Text(
      "Cancelar",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
    color: Colors.red,
    child: Text(
      "Eliminar",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),
    onPressed: () {
      FirebaseFirestore.instance.collection('producto').doc(id).delete();
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Alerta",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: black,
      ),
    ),
    content: Text(
        "Una vez eliminado el producto, no hay vuelta atrás. ¿Estás seguro?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
