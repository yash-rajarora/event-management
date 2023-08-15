import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:event/profile.dart';
import 'package:event/screens/home.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _selectedIndex=0;
  static final List<Widget>_widgetOptions = <Widget>[
    HomeScreen(),
    const Text("search"),
    const Text("Explore"),
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
        backgroundColor: kPrimaryColor,

        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        elevation: 10,
        selectedItemColor: Colors.white,
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
          icon: Icon(Icons.explore_outlined),
          activeIcon: Icon(Icons.explore),
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
