import 'package:flutter/material.dart';
import './screens/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'McHacks2021',
      theme: ThemeData(
          fontFamily: "Montserrat-Medium", brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
