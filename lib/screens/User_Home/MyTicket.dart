import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/Registered card.dart';
import 'package:qr_flutter/qr_flutter.dart';


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
  List<UserData> userDataList = [];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 25),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Text("Registered Events", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black)),
          ),
          divider(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...userDataList.map((userData) {
                  return OrderContainer(
                    productName: userData.eventName,
                    email: userData.email,
                    orderStatus: 'Confirmed',
                  );
                }).toList(),
                SizedBox(height: 16), // Add some spacing between the OrderContainers and the button

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserData {
  final String eventName;
  final String email;

  UserData({
    required this.eventName,
    required this.email,
  });
}

