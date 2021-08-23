import 'package:banking_app_firebase/screens/customers_info.dart';
import 'package:banking_app_firebase/screens/login_screen.dart';
import 'package:banking_app_firebase/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: WelcomeScreen.id,
    routes: {
      WelcomeScreen.id: (context) => WelcomeScreen(),
      LoginScreen.id: (context) => LoginScreen(),
      CustomerScreen.id: (context) => CustomerScreen(),
    },
  ));
}
