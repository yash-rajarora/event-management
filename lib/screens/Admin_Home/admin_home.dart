import 'package:event/profile.dart';
import 'package:event/screens/Admin_Home/Component/create_event.dart';
import 'package:event/screens/Home/Explore.dart';
import 'package:event/screens/Home/MyTicket.dart';
import 'package:event/screens/home.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(58, 107, 53, 1);
const kPrimaryLightColor = Color.fromRGBO(203, 209, 143,0.8);

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  int _selectedIndex=0;
  static final List<Widget>_widgetOptions = <Widget>[
    CreateEvent(),
    ExplorePage(),
    MyTicket(),
    Profile()
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
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,

          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          elevation: 10,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Color.fromARGB(255, 162, 166, 172),
          showSelectedLabels: false,
          showUnselectedLabels: false,

          items:const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon:Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
            ),
            BottomNavigationBarItem(
              label: "Explore",
              icon: Icon(CupertinoIcons.ticket),
              activeIcon: Icon(CupertinoIcons.ticket_fill),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon:Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
            ),
          ]),
    );
  }
}
