import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class popupReservar extends StatefulWidget {
  final String nombreAlerta;
  final int cantidadAlerta;
  final String idAlerta;

  const popupReservar({
    Key key,
    @required this.nombreAlerta,
    @required this.cantidadAlerta,
    @required this.idAlerta,
  }) : super(key: key);

  @override
  _popupReservarState createState() => _popupReservarState();
}

class _popupReservarState extends State<popupReservar> {
  int _currentValue = 1;
  String _dropdownValue = "Efectivo";
  String _pickupTime = "Lo antes posible";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        "Reservar " + widget.nombreAlerta,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Text(
                "Cantidad a reservar:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              new NumberPicker.integer(
                  initialValue: _currentValue,
                  minValue: 1,
                  maxValue: widget.cantidadAlerta,
                  onChanged: (newValue) =>
                      setState(() => _currentValue = newValue)),
              SizedBox(height: 20),
              Text(
                "Método de pago:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String>(
                value: _dropdownValue,
                onChanged: (String newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                  });
                },
                items: <String>['Efectivo', 'Tarjeta crédito/débito']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                "¿Cuándo deseas recogerlo?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String>(
                value: _pickupTime,
                onChanged: (String newValue) {
                  setState(() {
                    _pickupTime = newValue;
                  });
                },
                items: <String>[
                  'Lo antes posible',
                  'En media hora',
                  'En dos horas'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Container(
                width: 500,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: RaisedButton(
                    onPressed: () {
                      // Reservar y retornar _dropdownValue (metodo de pago) y
                      // _currentValue (cantidad)
                      FirebaseFirestore.instance
                          .collection('producto')
                          .doc(widget.idAlerta)
                          .update({
                        'unidades': widget.cantidadAlerta - _currentValue
                      }).then((value) {
                        FirebaseFirestore.instance.collection('reserva').add({
                          'fecha': DateTime.now().toString(),
                          'producto': widget.idAlerta,
                          'medio_pago': _dropdownValue,
                          'unidades': _currentValue,
                          'tiempo_recogida': _pickupTime,
                        });
                      });
                      Navigator.pop(context);
                    },
                    color: green,
                    textColor: white,
                    child: Text(
                      "RESERVAR",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
