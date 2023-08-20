import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:flutter/material.dart';
import 'package:event/screens/Events.dart';
import 'package:event/screens/Home/components/Registered card.dart';

class MyTicket extends StatefulWidget {
  const MyTicket({super.key});

  @override
  State<MyTicket> createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Text("Registered Events", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,color: kPrimaryColor),),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OrderContainer(
                  productName: 'JECRC CLOUD SUMMIT',
                  orderDate: '2023-08-17',
                  orderStatus: 'Confirmed',
                  totalPrice: 0,
                ),
                OrderContainer(
                  productName: 'JECRC MUN',
                  orderDate: '2023-08-15',
                  orderStatus: 'Pending',
                  totalPrice: 100.0,
                ),
                OrderContainer(
                  productName: 'JECRC REN',
                  orderDate: '2023-08-15',
                  orderStatus: 'Failed',
                  totalPrice: 30.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}