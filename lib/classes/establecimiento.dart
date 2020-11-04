import 'package:cloud_firestore/cloud_firestore.dart';

class Establecimiento {
  String nombre;
  String direccion;
  String email;

  Establecimiento(this.nombre, this.direccion, this.email);

  Establecimiento.fromSnapshot(DocumentSnapshot snapshot) {
    this.nombre = snapshot["nombre"];
    this.direccion = snapshot["direccion"];
    this.email = snapshot.id;
  }
}
