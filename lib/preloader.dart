import 'package:event/screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true; // Initially set to true

  @override
  void initState() {
    super.initState();
    // Simulate loading for 2 seconds
    simulateLoading();
  }

  void simulateLoading() async {
    // Add any loading tasks here
    await Future.delayed(Duration(seconds: 2));

    // After loading tasks are complete, set isLoading to false
    setState(() {
      isLoading = false;
    });

    // Use the Navigator to push the LoginScreen onto the stack
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
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
              Color.fromRGBO(159, 208, 181, 1),
              Color.fromRGBO(66, 138, 157, 1),
              Color.fromRGBO(159, 208, 181, 1),
            ],
          ),
        ),
        // Show a loading indicator if isLoading is true
        child: isLoading
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/event_logo.jpg', // Replace with your logo asset path
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
              ),
              CircularProgressIndicator(), // You can customize this loading indicator
            ],
          ),
        )
            : null, // Show nothing when isLoading is false
      ),
    );
  }
}