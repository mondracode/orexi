import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/reportar.dart';

class BoughtProduct extends StatefulWidget {
  final String productId;
  final String productImage;
  final String productName;
  final String restaurantName;
  final int productPrice;
  final Function press;

  const BoughtProduct({
    Key key,
    this.productId,
    this.productImage,
    this.productName,
    this.restaurantName,
    this.productPrice,
    this.press,
  }) : super(key: key);

  @override
  _BoughtProductState createState() => _BoughtProductState();
}

class _BoughtProductState extends State<BoughtProduct> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.25,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: darkGray.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            //width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.productImage),
                fit: BoxFit.fitHeight,
              ),
              color: gray,
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 15),
              //width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.productName,
                    style: TextStyle(
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.restaurantName,
                    style: TextStyle(
                      color: black,
                      fontSize: 12,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "\$" + widget.productPrice.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: FlatButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return Reportar();
                            },
                          );
                        },
                        color: green,
                        child: Text(
                          "Reportar",
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
