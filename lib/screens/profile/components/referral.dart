import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';


void main() {
  runApp(MaterialApp(
    home: ReferralCodeScreen(),
  ));
}

class ReferralCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Referral Code'),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              Text(
                'Share your referral code with friends!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your Referral Code:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'XYZ', // Replace with actual referral code
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement the logic to share the referral code
                  // For example: You can use the Share package to share the code
                },
                child: Text('Share'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
