import 'package:event/screens/Organizer_home/Component/create_event.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user_Home/profile.dart';
import 'Component/offline_page.dart';
import 'Component/online_page.dart';
import 'package:event/screens/Organizer_home/Component/scan.dart';

const kPrimaryColor = Color.fromRGBO(58, 107, 53, 1);
const kPrimaryLightColor = Color.fromRGBO(203, 209, 143,0.8);

class OrganizerHome extends StatefulWidget {
  const OrganizerHome({super.key});

  @override
  State<OrganizerHome> createState() => _OrganizerHomeState();
}

class _OrganizerHomeState extends State<OrganizerHome> {

  int _selectedIndex=0;
  static final List<Widget>_widgetOptions = <Widget>[
    CreateEventorg(),
    OnlinePageorg(),
    OfflinePageorg(),
    ScanQr(),
    Profile(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(child: _widgetOptions[_selectedIndex],),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(

            backgroundColor: Colors.white,

            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            elevation: 10,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: Color.fromARGB(255, 162, 166, 172),


            items:const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              ),
              BottomNavigationBarItem(
                label: "Online",
                icon:Icon(FluentSystemIcons.ic_fluent_globe_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_globe_regular),
              ),
              BottomNavigationBarItem(
                label: "Offline",
                icon: Icon(FluentSystemIcons.ic_fluent_cloud_offline_regular),
                // icon: Icon(CupertinoIcons.ticket),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_cloud_offline_filled),
              ),
              BottomNavigationBarItem(
                label: "Scan",
                icon:Icon(FluentSystemIcons.ic_fluent_qr_code_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_qr_code_filled),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon:Icon(FluentSystemIcons.ic_fluent_person_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              ),
            ]),
      ),
    );
  }
}
