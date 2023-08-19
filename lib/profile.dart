import 'package:event/profile/referral.dart';
import 'package:event/profile/tnc.dart';
import 'package:event/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:event/profile/notification.dart';
import 'package:event/profile/Faqs.dart';
import 'package:event/profile/help.dart';
import 'package:event/profile/privacy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: ListView(
        padding: const EdgeInsets.all(12),
        physics: const BouncingScrollPhysics(),
        children: [
          Container(height: 35),
          userTile(),
          divider(),
          colorTiles(context),
          divider(),
          bwTiles(context),
          divider(),
          logoutTile(context),
          SizedBox(height: 10),
          version()
        ],
      ),
    );
  }
}

Widget userTile() {
  String url =
      "https://i.pinimg.com/236x/3f/11/9f/3f119fc68701915b53cf00164fef1293.jpg"; // Replace this with a valid image URL
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(url),
    ),

    title: const Text("supriya",style: TextStyle(fontSize: 20),),
    subtitle: const Text("flutter"),
  );
}

Widget divider() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Divider(
      thickness: 1.5,
    ),
  );
}

Widget colorTiles(BuildContext context) {
  return Column(
    children: [
      colorTile(Icons.person_outline, Colors.deepPurple, "My events", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }),
      colorTile(Icons.settings_outlined, Colors.blue, "Notifications", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsScreen()),
        );
      }),
      colorTile(Icons.wallet, Colors.pinkAccent, "Referral code", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReferralCodeScreen()),
        );
      }),
    ],
  );
}

Widget bwTiles(BuildContext context) {
  Color color = Colors.blueGrey.shade800;
  return Column(
    children: [
      bwTile(Icons.info_outline, "FAQs", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FAQScreen()),
        );
      }),
      bwTile(Icons.border_color_outlined, "Terms & Conditions", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TncScreen()),
        );
      }),
      bwTile(Icons.textsms_outlined, "Help center", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HelpCenterScreen()),
        );
      }),
      bwTile(Icons.privacy_tip, "Privacy policy", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
        );
      }),
    ],
  );
}

Widget bwTile(IconData icon, String text, VoidCallback onTap) {
  return colorTile(icon, Colors.black, text, onTap);
}

Widget colorTile(IconData icon, Color color, String text, VoidCallback onTap) {
  Color pickedColor = Color(0xfff3f4fe);
  return ListTile(
    leading: Container(
      child: Icon(icon, color: color),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: color.withOpacity(0.09),
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    title: Text(text),
    trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20),
    onTap: onTap,
  );
}

Widget logoutTile(BuildContext context) {
  return ListTile(
    leading: Container(
      child: Icon(Icons.logout, color: Colors.red),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.09),
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    title: Text('Logout', style: TextStyle(color: Colors.red)),
    onTap: () async {
      await FirebaseAuth.instance.signOut();

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('stayLoggedIn', false);

      Navigator.pushNamed(context, 'welcome'); // Replace 'welcome' with your welcome route name
    },
  );
}


Widget version() {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        'Version 2.0.3',
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    ),
  );
}