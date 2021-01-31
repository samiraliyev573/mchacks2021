import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import './screens/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

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
      theme: ThemeData(fontFamily: "Roboto-Light", brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/logo.png'),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: Color.fromRGBO(40, 40, 50, 1),
        duration: 3000,
      ),
    );
  }
}
