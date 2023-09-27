import 'package:event/components/already_have_an_account_acheck.dart';
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
          color: kPrimaryLightColor, // Set the background color to white
          borderRadius: BorderRadius.circular(10), // Add border radius if needed
        ),
        child: isLoading
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo2.png', // Replace with your logo asset path
                width: 400, // Adjust the width as needed
                height: 400, // Adjust the height as needed
              ),
              SizedBox(height: 20), // Add some space between the image and the loading indicator
              CircularProgressIndicator(), // You can customize this loading indicator
              SizedBox(height: 20), // Add some space between the loading indicator and other content
              Text(
                'Loading...', // You can customize this text or remove it
                style: TextStyle(fontSize: 18), // Customize the text style
              ),
            ],
          ),
        )
            : null, // Show nothing when isLoading is false
      ),
    );
  }
}