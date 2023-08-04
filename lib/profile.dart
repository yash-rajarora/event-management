import 'package:flutter/material.dart';

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
          colorTiles(),
          divider(),
          bwTiles(),
        ],
      ),
    );
  }
}

Widget userTile() {
  String url =
      "https://example.com/image.jpg"; // Replace this with a valid image URL
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(url),
    ),
    title: const Text("supriya"),
    subtitle: const Text("ux designer"),
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

Widget colorTiles() {
  return Column(
    children: [
      colorTile(Icons.person_outline, Colors.deepPurple, "Personal data"),
      colorTile(Icons.settings_outlined, Colors.blue, "Settings"),
      colorTile(Icons.wallet, Colors.pinkAccent, "Payment"),
      colorTile(Icons.favorite_border, Colors.amber, "Refferal code"),
    ],
  );
}

Widget bwTiles() {
  Color color = Colors.blueGrey.shade800;
  return Column(
    children: [
      bwTile(Icons.info_outline, "FAQs"),
      bwTile(Icons.border_color_outlined, "Handbook"),
      bwTile(Icons.textsms_outlined, "Community"),
    ],
  );
}

Widget bwTile(IconData icon, String text) {
  return colorTile(icon, Colors.black, text);
}

Widget colorTile(IconData icon, Color color, String text) {
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
  );
}