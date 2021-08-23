import 'package:banking_app_firebase/screens/login_screen.dart';
import 'package:banking_app_firebase/screens/register_screen.dart';
import 'package:banking_app_firebase/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: WelcomeScreen.id,
    routes: {
      WelcomeScreen.id: (context) => WelcomeScreen(),
      LoginScreen.id: (context) => LoginScreen(),
      RegisterScreen.id: (context) => RegisterScreen(),
    },
  ));
}
