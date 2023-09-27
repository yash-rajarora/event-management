import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/screens/User_Home/components/getticket_topImage.dart';
import 'package:event/screens/User_Home/components/online_events.dart';
import 'package:event/screens/User_Home/home.dart';
import 'package:event/utils/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GetTickets extends StatefulWidget {
  @override
  _GetTicketsState createState() => _GetTicketsState();
}

class _GetTicketsState extends State<GetTickets> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenoController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _eventnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 50,),
                const GetTicketTopImage(),
                // SizedBox(height: 100),
                SizedBox(height: 20),
                TextFormField(
                  controller: _eventnameController,
                  decoration: InputDecoration(
                    hintText: 'Event Name',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.event),
                    ),
                    fillColor: kPrimaryLightColor,
                    // Change to your desired color
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.person),
                    ),
                    fillColor: kPrimaryLightColor,
                    // Change to your desired color
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.email),
                    ),
                    fillColor: kPrimaryLightColor,
                    // Change to your desired color
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _phonenoController,
                  decoration: InputDecoration(
                    hintText: 'Phone number',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.phone),
                    ),
                    fillColor: kPrimaryLightColor,
                    // Change to your desired color
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _yearController,
                  decoration: InputDecoration(
                    hintText: 'Year',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.book),
                    ),
                    fillColor: kPrimaryLightColor,
                    // Change to your desired color
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      final uid = user.uid;
                      final currentTime = DateTime.now();
                      final formattedTime = currentTime.toUtc();

                      await FirebaseFirestore.instance.collection(uid).doc(formattedTime.toString()).set({
                        'Name': _nameController.text,
                        'Email': _emailController.text,
                        'Phone Number': _phonenoController.text,
                        'Year': _yearController.text,
                        'Event Name': _eventnameController.text,
                      }).then((_) {
                        Navigator.pushNamed(context, 'home');
                      }).catchError((error) {
                        // Handle any errors that occur during the Firestore operation.
                        print("Error: $error");
                      });
                    } else {
                      // Handle the case where the user is not authenticated.
                    }
                  },
                  child: Text('Submit'),
                ),

              ],
            ),
          ),
        ),
      ),
    ));
  }
}
