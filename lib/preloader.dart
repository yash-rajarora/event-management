import 'package:event/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 2 seconds to simulate the splash screen duration
    Future.delayed(Duration(seconds: 1), () {
      // Use the Navigator to push the LoginScreen onto the stack
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyLogin()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Load the app icon using the FlutterLogo widget (you can replace this with your app's actual icon)
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color.fromRGBO(159, 208, 181,1),
                Color.fromRGBO(66, 138, 157,1),
                Color.fromRGBO(159, 208, 181,1),
              ]
          ),
        ),
        child:Center(
          child: Image.asset('assets/icon.png'),
        ),
      ),
    );
  }
}
