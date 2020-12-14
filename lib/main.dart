import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:orexi/screens/signup/components/body_client.dart';
import 'package:orexi/screens/user_main_flow/bottom_nav_bar.dart';
import 'package:orexi/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'screens/loading/loading_screen.dart';
import 'screens/error/error_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Phoenix(
    child: App(),
  ));
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final firestoreInstance = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Orexi',
            theme: ThemeData(fontFamily: 'OpenSans'),
            home: Error(),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show loading screen (temporary screen)
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Orexi',
          theme: ThemeData(fontFamily: 'OpenSans'),
          home: Loading(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    //Check if logged in
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (!(user == null)) {
        isLoggedIn = true;
      }
    });
    // if not logged in
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orexi',
      theme: ThemeData(fontFamily: 'OpenSans'),
      home: isLoggedIn ? MyBottomNavigationBar() : Welcome(),
    );
  }
}
