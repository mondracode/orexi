import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/constants.dart';

class popupReservar extends StatefulWidget {
  final String nombreAlerta;

  const popupReservar({
    Key key,
    @required this.nombreAlerta,
  }) : super(key: key);

  @override
  _popupReservarState createState() => _popupReservarState();
}

class _popupReservarState extends State<popupReservar> {
  int _currentValue = 1;
  String _dropdownValue = "Efectivo";
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
                  maxValue: 20,
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
              Container(
                width: 500,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: RaisedButton(
                    onPressed: () {},
                    // Reservar y retornar _dropdownValue (metodo de pago) y
                    // _currentValue (cantidad)
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
