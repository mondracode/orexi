import 'package:flutter/material.dart';
import 'package:orexi/screens/signup/components/background.dart';
import 'package:orexi/screens/signup/components/choose_button.dart';
import 'package:orexi/screens/signup/signup_client.dart';
import 'package:orexi/screens/signup/signup_seller.dart';
import 'package:orexi/constants.dart';

class SignupSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.1),
        child: AppBar(
          backgroundColor: white,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: black,
          ),
          elevation: 0,
          title: Text(
            "¿Qué te gustaría?",
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            ),
          ),
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ChooseButton(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignupUser();
                      },
                    ),
                  );
                },
                img: Image.asset('assets/images/placeholder.png'),
              ),
              Text(
                "Quiero comprar",
                style: TextStyle(
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ChooseButton(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignupSeller();
                      },
                    ),
                  );
                },
                img: Image.asset('assets/images/placeholder.png'),
              ),
              Text(
                "Quiero vender",
                style: TextStyle(
                  color: black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
