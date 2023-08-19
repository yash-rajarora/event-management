import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../Login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final _EmailController = TextEditingController();
final _PasswordController = TextEditingController();

const kPrimaryColor = Color.fromRGBO(58, 107, 53, 1);
const kPrimaryLightColor = Color.fromRGBO(203, 209, 143,0.7);

const double defaultPadding = 16.0;


class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextField(
            controller: firstNameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onChanged: (firstNameController) {},
            decoration: InputDecoration(
              hintText: 'First Name',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(height: 5),
          TextField(
            controller: lastNameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onChanged: (lastNameController) {},
            decoration: InputDecoration(
              hintText: 'Last Name',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(height: 5),
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
                child: Icon(Icons.email),
              ),
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
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
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _EmailController.text,
                password: _PasswordController.text,
              ).then((value) {

                // Create a Firestore document to store user information
                FirebaseFirestore.instance.collection('users').doc(value.user?.uid).set({
                  'email': _EmailController.text,
                  'firstName': firstNameController.text,
                  'lastName' : lastNameController.text,
                  'role': 'user', // Set the user's role as "user"
                }).then((_) {
                  Navigator.pushNamed(context, 'home');
                });

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
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
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

