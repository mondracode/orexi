import 'package:flutter/material.dart';
import 'package:orexi/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'screens/loading/loading_screen.dart';
import 'screens/error/error_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  //final firestoreInstance = FirebaseFirestore.instance;
  //acá algo falla

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orexi',
      theme: ThemeData(fontFamily: 'OpenSans'),
      home: Welcome(),
    );
  }
}
