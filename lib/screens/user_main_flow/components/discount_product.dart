import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';
import 'package:orexi/screens/user_main_flow/components/popup_reservar.dart';

class DiscountProduct extends StatefulWidget {
  final String productId;
  final String productImage;
  final String productName;
  final String productDesc;
  final int productFormerPrice;
  final int productCurrentPrice;
  final int productDistance;
  final int productQuantity;
  final int productDiscount;
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
    @required this.productQuantity,
    @required this.productDiscount,
    this.press,
  }) : super(key: key);

  @override
  _DiscountProductState createState() => _DiscountProductState();
}

class _DiscountProductState extends State<DiscountProduct> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String discount = "-" + widget.productDiscount.toString() + " %";
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
                    image: AssetImage(widget.productImage),
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
                    widget.productName,
                    style: TextStyle(
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.productDesc,
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
                          text: "\$" +
                              widget.productCurrentPrice.toString() +
                              " ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: green,
                          ),
                        ),
                        TextSpan(
                          text: "\$" + widget.productFormerPrice.toString(),
                          style: TextStyle(
                            color: black,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        TextSpan(
                          text: " - " +
                              widget.productDistance.toString() +
                              " metros",
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
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return popupReservar(
                                nombreAlerta: widget.productName,
                                idAlerta: widget.productId,
                                cantidadAlerta: widget.productQuantity,
                                nuevoPrecio: widget.productCurrentPrice,
                              );
                            },
                          );
                        },
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
