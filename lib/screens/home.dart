import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:event/screens/Events.dart';
import 'package:event/screens/offline_event.dart';
import 'package:event/screens/online_events.dart';
import 'package:event/utils/app_styles.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(58, 107, 53, 1);
const kPrimaryLightColor = Color.fromRGBO(203, 209, 143,0.8);
const kPrimaryLightColor2 = Color.fromRGBO(203, 209, 143,0.4);


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(right: 25),
              child: userTile(),
            ),
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Text("Discover Events", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, fontFamily: 'inner'),),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left:20),
                child: Row(
                  children: [
                    EventScreen(),
                    EventScreen(),
                    EventScreen(),
                    EventScreen(),
                  ],
                )
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Text("Online Events", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, fontFamily: 'inner'),),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left:20),
              child: Row(
                children: [
                  OnlineEventScreen(),
                  OnlineEventScreen(),
                  OnlineEventScreen(),
                  OnlineEventScreen(),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Text("Offline Events", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, fontFamily: 'inner'),),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left:20),
              child: Row(
                children: [
                  OfflineEventScreen(),
                  OfflineEventScreen(),
                  OfflineEventScreen(),
                  OfflineEventScreen(),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        )
    );
  }
}
Widget userTile() {
  String url =
      "https://i.pinimg.com/236x/3f/11/9f/3f119fc68701915b53cf00164fef1293.jpg"; // Replace this with a valid image URL
  return Align(
      alignment: Alignment.topRight,
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        // backgroundImage: NetworkImage(url),
        radius: 28,
      )
  );
}
