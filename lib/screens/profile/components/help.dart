import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';


void main() {
  runApp(MaterialApp(
    home: HelpCenterScreen(),
  ));
}

class HelpCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 30),
            Text(
              'Welcome to the Help Center for EventConnect. \nIf you have any questions, concerns, or feedback, please feel free to reach out to us. '
              '\nOur support team is here to assist you.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Implement the action to contact support or open a support form
                // For demonstration, we can show a simple alert
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Contact Support'),
                      content: Text('You can reach us at admin@jecrc.ac.in'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Contact Support'),
            ),
          ],
        ),
      ),
    );
  }
}
