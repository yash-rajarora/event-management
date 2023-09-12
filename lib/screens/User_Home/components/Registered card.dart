import 'package:flutter/material.dart';

class OrderContainer extends StatelessWidget {
  final String productName;
  final String email;
  final String orderStatus;


  const OrderContainer({
    required this.productName,
    required this.email,
    required this.orderStatus,
  });

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
            productName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Email: $email',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 5),
          Text(
            'Status: $orderStatus',
            style: TextStyle(fontSize: 14, color: _getStatusColor(orderStatus)),
          ),
          SizedBox(height: 10),
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
