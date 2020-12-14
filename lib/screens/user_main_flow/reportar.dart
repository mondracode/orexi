import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/background.dart';

class Reportar extends StatefulWidget {
  final String productId;

  Reportar({
    Key key,
    @required this.productId,
  }) : super(key: key);

  @override
  _ReportarState createState() => _ReportarState();
}

class _ReportarState extends State<Reportar> {
  // Para controlar el contenido del TextField
  final myController = TextEditingController();
  String content;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Reportar producto",
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "La información ingresada será revisada por un moderador. " +
                      "Por favor sé conciso y describe los detalles importantes.",
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  autofocus: true,
                  maxLength: 500,
                  maxLines: null,
                  onChanged: (value) {
                    content = value;
                  },
                  controller: myController,
                  decoration: InputDecoration(
                    labelText: 'Descripción del incidente',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: green),
                    ),
                    labelStyle: TextStyle(color: black),
                  ),
                ),
              ),
              RoundedButton(
                text: "Enviar reporte",
                press: () {
                  FirebaseFirestore.instance.collection('reporte').add({
                    'contenido': content,
                    'id_producto': widget.productId,
                  });

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
