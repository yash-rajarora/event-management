import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:event/screens/user_Home/profile.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/user_Home/Explore.dart';
import '../screens/user_Home/MyTicket.dart';
import '../screens/user_Home/home.dart';

const kPrimaryColor = Color.fromRGBO(58, 107, 53, 1);
const kPrimaryLightColor = Color.fromRGBO(203, 209, 143,0.8);

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _selectedIndex=0;
  static final List<Widget>_widgetOptions = <Widget>[
    HomeScreen(),
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
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,

          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          elevation: 20,

          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Color.fromARGB(255, 162, 166, 172),


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
            label: "My Tickets",
            icon: Icon(CupertinoIcons.ticket),
            activeIcon: Icon(CupertinoIcons.ticket_fill),
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
