import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';

class CustomAppbar extends StatelessWidget {
  final String text;

  const CustomAppbar({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.1),
        child: AppBar(
          backgroundColor: gray,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: black,
          ),
          elevation: 0,
          title: Text(
            text,
            style: TextStyle(color: black),
          ),
        ),
      ),
    );
  }
}
