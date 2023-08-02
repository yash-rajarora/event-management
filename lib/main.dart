import 'package:event/forgot.dart';
import 'package:event/home.dart';
import 'package:event/login.dart';
import 'package:event/preloader.dart';
import 'package:event/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF90A4AE); // Pastel Blue-Gray
  static const Color secondaryColor = Color(0xFFF48FB1); // Pastel Pink
  static const Color accentColor = Color(0xFFFFD54F); // Pastel Yellow
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'preloader',
    routes: {
      'preloader' : (context) => SplashScreen(),
      'login' : (context) => MyLogin(),
      'register' : (context) => MyRegister(),
      'forgot':(context) => MyForgot(),
      'home':(context) => Home()
    },
  ));
}

