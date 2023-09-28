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
    fetchUserList(); // Call the function to fetch user data when the widget is created
  }

  Future<void> fetchUserList() async {
    final user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    final userDocs = await FirebaseFirestore.instance.collection(uid!).get();
    setState(() {
      userDataList = userDocs.docs.map((doc) {
        return UserData(
          eventName: doc.data()?['Event Name'] ?? "",
          email: doc.data()?['Email'] ?? "",
        );
      }).toList();
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
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('QR Code Ticket'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              QrImageView(
                                data: '1234567890',
                                version: QrVersions.auto,
                                size: 200.0,
                              ),
                              SizedBox(height: 16.0),
                              Text('Scan this QR code to access your ticket.'),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("Your Button Text"),
                ),
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

