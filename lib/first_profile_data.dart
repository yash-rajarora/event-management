import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: kPrimaryColor, // Change to your desired color
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add Your Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: firstNameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onChanged: (firstNameController) {},
                decoration: InputDecoration(
                  hintText: 'First Name',
                  fillColor: kPrimaryLightColor, // Change to your desired color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: lastNameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onChanged: (lastNameController) {},
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  fillColor: kPrimaryLightColor, // Change to your desired color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onChanged: (email) {},
                decoration: InputDecoration(
                  hintText: 'Email ID',
                  fillColor: kPrimaryLightColor, // Change to your desired color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance.collection('users').add({
                    'email': _emailController.text,
                    'firstName': firstNameController.text,
                    'lastName' : lastNameController.text,
                    }).then((_) {
                      Navigator.pushNamed(context, 'home');
                    }).catchError((error, stackTrace) {
                    String errorMessage = "An error occurred. Please try again later.";

                    if (error is FirebaseAuthException) {
                      errorMessage = error.message ?? errorMessage;
                    }

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Add border radius here
                          ),
                          title: Text(
                            "Error",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.red, // Customize the color
                            ),
                          ),
                          content: Text(
                            errorMessage,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black, // Customize the color
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                "OK",
                                style: TextStyle(
                                  color: Colors.blue, // Customize the color
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  });
                  },
                child: Text("Sign Up".toUpperCase()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
