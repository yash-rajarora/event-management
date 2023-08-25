import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../Signup/signup_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const kPrimaryColor = Color.fromRGBO(58, 107, 53, 1);
const kPrimaryLightColor = Color.fromRGBO(203, 209, 143,0.7);

const double defaultPadding = 16.0;
final _EmailController = TextEditingController();
final _PasswordController = TextEditingController();

class LoginForm extends StatelessWidget {

  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _EmailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding),
            child: TextFormField(
              controller: _PasswordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          Container(
            child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'forgot');
                },
                child: Text(
                    'Fogot Password',
                    style: TextStyle(
                      fontSize: 12,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold
                    ),
                )
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _EmailController.text,
                password: _PasswordController.text,
              ).then((value) async {
// Save the login status
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('stayLoggedIn', true);

// Fetch user's role from Firestore
                final user = FirebaseAuth.instance.currentUser;
                final userDoc = await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
                final userRole = userDoc.data()?['role'];

// Check user's role
                if (userRole == 'admin') {
                  Navigator.pushReplacementNamed(context, 'admin_home'); // Replace with your admin page route
                } else {
                  Navigator.pushReplacementNamed(context, 'home'); // Replace with your user page route
                }
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
                      content: Text(errorMessage),
                      actions: <Widget>[
                        TextButton(
                          child: Text("OK"),
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
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(

            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


