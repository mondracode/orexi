import 'package:flutter/material.dart';

import 'package:orexi/components/text_field_container.dart';
import 'package:orexi/constants.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const SearchField({
    Key key,
    this.hintText,
    this.icon = Icons.search,
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
            color: superDarkGray,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
