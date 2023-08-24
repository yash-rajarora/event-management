import 'package:flutter/material.dart';
import '../../../components/already_have_an_account_acheck.dart';


void main() {
  runApp(MaterialApp(
    home: FAQScreen(),
  ));
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

class FAQScreen extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'What is this app about?',
      answer: '\nEventConnect: College Event Discovery and Registration App',
    ),
    FAQItem(
      question: 'Is there a way to handle payments securely within the app?',
      answer:
      '\nYes, you can make the payment inside the google form provided while registering using QR Code of the event.',
    ),
    FAQItem(
        question: 'How can attendees register for an event?',
        answer:
        '\nTo register for an event, users can navigate to the events page and find the Register button. They will be prompted to provide their details and select ticket options before confirming their registration.'),
    FAQItem(
        question: 'How can I view the list of events available on the app?',
        answer:
        '\nTo see the list of events, navigate to the app homepage or events tab. You will find a variety of events listed, each with details.'),
    FAQItem(
        question:
        'What if I need to cancel my registration for an event I have already paid for?',
        answer:
        '\nIf you need to cancel, find the event in your registered events list. There should be an option to cancel, and you may receive a refund based on the events cancellation policy.'),
    // Add more FAQ items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frequently Asked Questions'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView.separated(
          itemCount: faqItems.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return FAQListItem(faqItems[index]);
          },
        ),
      ),
    );
  }
}

class FAQListItem extends StatefulWidget {
  final FAQItem faqItem;

  FAQListItem(this.faqItem);

  @override
  _FAQListItemState createState() => _FAQListItemState();
}

class _FAQListItemState extends State<FAQListItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.faqItem.question,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Icon(
                  _expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          if (_expanded)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                widget.faqItem.answer,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
