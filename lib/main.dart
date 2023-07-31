import 'package:event/forgot.dart';
import 'package:event/login.dart';
import 'package:event/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login' : (context) => MyLogin(),
      'register' : (context) => MyRegister(),
      'forgot':(context) => MyForgot()
    },
  ));
}