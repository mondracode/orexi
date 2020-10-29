import 'package:flutter/material.dart';

import 'package:orexi/components/text_field_container.dart';
import 'package:orexi/constants.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const InputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: gray,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: gray,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
