import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:event/screens/User_Home/components/getticketsform.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OfflineEventScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const OfflineEventScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: screenHeight * 0.43,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(color: kPrimaryLightColor),
      child: Column(
        children: [
          Container(
            height: screenHeight* 0.32,
            child: Row(
              children: [
                Container(
                  width: screenWidth * 0.45,
                  height: 240,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(data['Second Image URL']), // assuming the Firestore field is named 'imageUrl'
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: screenWidth * 0.4,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          data['Event Name'], // assuming the Firestore field is named 'eventName'
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(height: 22),
                      Row(
                        children: [
                          Icon(
                            FluentSystemIcons.ic_fluent_clock_regular,
                            color: Colors.black,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              data['Date & Time'], // assuming the Firestore field is named 'eventDate'
                              style: TextStyle(color: Colors.black, fontSize: 15),
                              maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 22),
                      Row(
                        children: [
                          Icon(
                            FluentSystemIcons.ic_fluent_location_regular,
                            color: Colors.black,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              data['Location'], // assuming the Firestore field is named 'eventLocation'
                              style: TextStyle(color: Colors.black, fontSize: 15),
                              maxLines: 4,
                            ),
                          )
                        ],
                      ),
                      // SizedBox(height: 110),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: SizedBox(
              width: 500,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GetTickets()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 12.0,
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(color: Colors.black),
                ),
                child: const Text(
                  'Get a ticket',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
