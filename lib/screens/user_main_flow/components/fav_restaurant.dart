import 'package:flutter/material.dart';
import 'package:orexi/constants.dart';

class FavoriteRestaurant extends StatelessWidget {
  final String restaurantId;
  final String restaurantName;
  final String restaurantAddress;
  final String restaurantImage;
  final double restaurantRating;
  final Function press;

  const FavoriteRestaurant({
    Key key,
    this.restaurantId,
    @required this.restaurantName,
    @required this.restaurantAddress,
    @required this.restaurantImage,
    @required this.restaurantRating,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      height: size.height * 0.2,
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
                image: AssetImage(restaurantImage),
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
                    restaurantName,
                    style: TextStyle(
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    restaurantAddress,
                    style: TextStyle(
                      color: black,
                      fontSize: 14,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: black,
                        fontSize: 14,
                      ),
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.star,
                            size: 16,
                            color: restaurantRating > 8.0
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                        TextSpan(
                          text: " " + restaurantRating.toString(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: FlatButton(
                        onPressed: press,
                        color: green,
                        child: Text(
                          "Ver",
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
