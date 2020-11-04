import 'package:flutter/material.dart';
import 'package:orexi/components/already_have_account.dart';
import 'package:orexi/components/input_field.dart';
import 'package:orexi/components/password_field.dart';
import 'package:orexi/components/rounded_button.dart';
import 'package:orexi/screens/login/login_screen.dart';
import 'package:orexi/screens/seller_main_flow/bottom_nav_bar.dart';
import 'package:orexi/screens/welcome/components/background.dart';
import 'package:orexi/constants.dart';

class BodySeller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String authEmail;
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
            "¡Solo un paso más!",
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
              InputField(
                hintText: "Nombre del establecimiento",
                //icon: IconData(58840),
                onChanged: (value) {},
              ),
              InputField(
                hintText: "E-mail",
                onChanged: (value) {},
              ),
              InputField(
                hintText: "Dirección del establecimiento",
                onChanged: (value) {},
              ),
              PasswordField(
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                text: "COMENZAR A VENDER",
                press: () {
                  

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SellerBottomNavigationBar();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAccount(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
