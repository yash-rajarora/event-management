import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderContainer extends StatefulWidget {
  const OrderContainer({super.key, required this.productName, required this.email, required this.orderStatus});
  final String productName;
  final String email;
  final String orderStatus;

  @override
  State<OrderContainer> createState() => _OrderContainerState();
}

class _OrderContainerState extends State<OrderContainer> {

  @override

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.productName,  // Use widget.productName
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Email: ${widget.email}',  // Use widget.email
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 5),
          Text(
            'Status: ${widget.orderStatus}',  // Use widget.orderStatus
            style: TextStyle(fontSize: 14, color: _getStatusColor(widget.orderStatus)),
          ),
          SizedBox(height: 10),
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
                          data: '123456789',
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
            child: Text("Show Ticket"),
          ),
        ],
      ),
    );

  }
  Color _getStatusColor(String status) {
    if (status == 'Pending') {
      return Colors.orange;
    } else if (status == 'Confirmed') {
      return Colors.green;
    } else {
      return Colors.red;
    }
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
