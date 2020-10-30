import 'package:flutter/material.dart';

class ChooseButton extends StatelessWidget {
  final Function press;
  final Image img;

  const ChooseButton({
    Key key,
    @required this.press,
    @required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextButton(
          onPressed: press,
          child: img,
        ),
      ),
    );
  }
}
