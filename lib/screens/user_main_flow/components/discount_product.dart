import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';

class DiscountProduct extends StatelessWidget {
  final String productId;
  final String productImage;
  final String productName;
  final String productDesc;
  final int productFormerPrice;
  final int productCurrentPrice;
  final int productDistance;
  final Function press;

  const DiscountProduct({
    Key key,
    this.productId,
    @required this.productImage,
    @required this.productName,
    @required this.productDesc,
    @required this.productFormerPrice,
    @required this.productCurrentPrice,
    @required this.productDistance,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String discount =
        (((productFormerPrice - productCurrentPrice) / productFormerPrice) *
                    100)
                .toStringAsFixed(2) +
            "%";
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 20,
                  width: 70,
                  color: green,
                  child: Text(
                    discount,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                //width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(productImage),
                    fit: BoxFit.fitHeight,
                  ),
                  color: gray,
                ),
              ),
            ],
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
                    productName,
                    style: TextStyle(
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    productDesc,
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
                          text: "\$" + productCurrentPrice.toString() + " ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: green,
                          ),
                        ),
                        TextSpan(
                          text: "\$" + productFormerPrice.toString(),
                          style: TextStyle(
                            color: black,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        TextSpan(
                          text: " - " + productDistance.toString() + " metros",
                          style: TextStyle(color: black),
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
                        onPressed: press,
                        color: green,
                        child: Text(
                          "Reservar",
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
