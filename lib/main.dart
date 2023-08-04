import 'package:event/forgot.dart';
import 'package:event/login.dart';
import 'package:event/preloader.dart';
import 'package:event/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:event/screens/bottom_bar.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home:  const BottomBar(),
    debugShowCheckedModeBanner: false,
    initialRoute: 'preloader',
    routes: {
      'preloader' : (context) => SplashScreen(),
      'login' : (context) => MyLogin(),
      'register' : (context) => MyRegister(),
      'forgot':(context) => MyForgot(),
      'home':(context) => BottomBar()
    },

  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primaryColor: primary,
      ),
      // home: const BottomBar()
    );
  }
}

