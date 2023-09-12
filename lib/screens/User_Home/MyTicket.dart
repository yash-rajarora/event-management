import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/Registered card.dart';


Widget divider() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Divider(
      thickness: 1.5,
    ),
  );
}

class MyTicket extends StatefulWidget {
  const MyTicket({super.key});

  @override
  State<MyTicket> createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket> {
  String userEventname = "";
  String userEmailid = "";

  @override
  void initState() {
    super.initState();
    fetchUserRole(); // Call the function to fetch the user role when the widget is created
  }

  Future<void> fetchUserRole() async {
    final user = FirebaseAuth.instance.currentUser;
    final userDoc = await FirebaseFirestore.instance.collection('data').doc(user?.uid).get();
    setState(() {
      userEventname = userDoc.data()?['Event Name'] ?? "";
      userEmailid = userDoc.data()?['Email'] ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 25),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Text("Registered Events", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,color: Colors.black),),
          ),
          divider(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OrderContainer(
                  productName: userEventname,
                  email: userEmailid,
                  orderStatus: 'Confirmed',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
