import 'package:event/preloader.dart';
import 'package:event/screens/Login/login_screen.dart';
import 'package:event/screens/Signup/signup_screen.dart';
import 'package:event/screens/Welcome/welcome_screen.dart';
import 'package:event/screens/forgot/forgot_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:event/utils/bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:event/screens/Admin_Home/admin_home.dart';


const kPrimaryColor = Color.fromRGBO(58, 107, 53, 1);
const kPrimaryLightColor = Color.fromRGBO(203, 209, 143,0.7);

const double defaultPadding = 16.0;
ThemeData theme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
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
    )// Using Poppins font
  // Other theme properties
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool stayLoggedIn = prefs.getBool('stayLoggedIn') ?? false;

  runApp(MaterialApp(
    home:  const BottomBar(),
    debugShowCheckedModeBanner: false,
    theme: theme,

    initialRoute: stayLoggedIn ? 'preloader' : 'home', // Navigate based on login status
    routes: {
      'welcome':(context) => WelcomeScreen(),
      'preloader' : (context) => SplashScreen(),
      'login' : (context) => LoginScreen(),
      'register' : (context) => SignUpScreen(),
      'forgot':(context) => forgot_password(),
      'home':(context) => BottomBar(),
      'admin_home':(context) => AdminHome(),
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


