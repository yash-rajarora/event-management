import 'package:event/forgot.dart';
import 'package:event/home.dart';
import 'package:event/login.dart';
import 'package:event/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login' : (context) => MyLogin(),
      'register' : (context) => MyRegister(),
      'forgot':(context) => MyForgot(),
      'home':(context) => Home()
    },
  ));
}