import 'package:cloud_firestore/cloud_firestore.dart';

class Producto {
  String nombre, descripcion, imagen_URL;
  double distancia, precio;

  Producto(this.nombre, this.descripcion, this.distancia, this.precio);

  Producto.fromSnapshot(DocumentSnapshot snapshot) {
    this.nombre = snapshot["nombre"];
    this.descripcion = snapshot["descripcion"];
    this.precio = snapshot["precio"];
    this.distancia = snapshot["distancia"];
  }
}
