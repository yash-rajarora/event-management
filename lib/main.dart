import 'package:event/forgot.dart';
import 'package:event/preloader.dart';
import 'package:event/screens/Login/login_screen.dart';
import 'package:event/screens/Signup/signup_screen.dart';
import 'package:event/screens/Welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:event/screens/bottom_bar.dart';

const kPrimaryColor = Color.fromRGBO(58, 107, 53, 1);
const kPrimaryLightColor = Color.fromRGBO(203, 209, 143,0.7);

const double defaultPadding = 16.0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home:  const BottomBar(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: kPrimaryColor,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: kPrimaryLightColor,
          iconColor: kPrimaryColor,
          prefixIconColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        )),

    initialRoute: 'welcome',
    routes: {
      'welcome':(context) => WelcomeScreen(),
      'preloader' : (context) => SplashScreen(),
      'login' : (context) => LoginScreen(),
      'register' : (context) => SignUpScreen(),
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

