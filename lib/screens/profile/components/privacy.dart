import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';


void main() {
  runApp(MaterialApp(
    home: PrivacyPolicyScreen(),
  ));
}

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '                        Privacy Policy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              ''' 
1. Introduction

Welcome to EventConnect. This Privacy Policy outlines how we collect, use, and protect your personal information. By accessing or using the App, you agree to the terms of this Privacy Policy.

2. Information We Collect

We may collect the following types of information:
- Personal Information: Name, email address, phone number, and other information you provide during registration or event participation.
- Usage Information: Information about your interactions with the App, including events attended and actions taken.

3. How We Use Your Information

We may use your information for the following purposes:
- Providing Services: To facilitate event registration, communication, and management.
- Communication: To send event-related notifications, updates, and promotional materials.
- Improving the App: To analyze usage patterns, improve user experience, and develop new features.

4. Data Sharing and Disclosure

We may share your information in the following ways:
- Event Organizers: Information you provide during event registration may be shared with the respective event organizers.
- Service Providers: We may share information with trusted service providers for app functionality, analytics, and communication.
- Legal Compliance: We may disclose information to comply with legal requirements or protect our rights.

5. Data Security

We implement appropriate measures to protect your data, but no method of transmission over the internet is completely secure. We cannot guarantee the security of your information.

6. Your Choices

You may:
- Access and Update Your Information: You can review and update your personal information in the App's settings.
- Opt-Out: You can opt out of promotional emails by following the unsubscribe instructions.
- Data Deletion: You can request the deletion of your account and associated data.

7. Children's Privacy

The App is not intended for use by individuals under the age of 13. We do not knowingly collect personal information from children.

8. Changes to this Privacy Policy

We may update this Privacy Policy periodically. Any changes will be posted on this page. Continued use of the App after changes signifies your acceptance of the updated policy.

9. Contact Us

If you have questions or concerns about this Privacy Policy, please contact us at EventConnect.''',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'This Privacy Policy is governed by the laws of EventConnect.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
