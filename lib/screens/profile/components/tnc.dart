import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';



class TncScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '               Terms and Conditions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '''By downloading, accessing, or using the EventConnect app, you agree to comply with and be bound by the following terms and conditions. If you do not agree to these terms, please do not use the App.

1. Acceptable Use

- The App is intended for users above the legal age of consent in your jurisdiction. Users under this age should obtain parental or guardian consent.
- You are solely responsible for your interactions and conduct within the App and at events.
- You agree not to use the App for any illegal, harmful, or unauthorized activities.

2. Event Registration and Attendance

- Registration for events through the App is subject to availability and event-specific terms.
- Event organizers reserve the right to deny access to any event for reasons including misconduct or failure to comply with event rules.

3. Privacy and Data Usage

- We collect and process personal data as outlined in our Privacy Policy. By using the App, you consent to our data practices.
- You agree not to share or misuse personal data of other users.

4. Intellectual Property

- All content, trademarks, and intellectual property within the App are protected by applicable laws and owned by EventConnect.

5. Disclaimers

- The App is provided on an as is basis. We do not warrant its accuracy, completeness, or suitability for any purpose.
- We are not responsible for the content, safety, or quality of events listed in the App.

6. Limitation of Liability

- In no event shall EventConnect be liable for any direct, indirect, incidental, consequential, or special damages arising from the use of the App.

7. Changes to Terms and App

- We reserve the right to modify or discontinue the App or these terms at any time.
- It is your responsibility to review these terms periodically.

8. Governing Law

- These terms shall be governed by and construed in accordance with the laws of EventConnect.

By using the App, you agree to these terms and conditions. If you have any questions or concerns, please contact us at EventConnect.''',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'By using this app, you agree to our Terms and Conditions.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
