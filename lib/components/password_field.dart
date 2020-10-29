import 'package:flutter/material.dart';

import 'text_field_container.dart';
import '../constants.dart';

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const PasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: gray,
        decoration: InputDecoration(
          hintText: "Contraseña",
          icon: Icon(
            Icons.lock,
            color: darkGray,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: darkGray,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
