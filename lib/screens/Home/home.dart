import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:event/screens/Events.dart';
import 'package:event/screens/offline_event.dart';
import 'package:event/screens/online_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


Widget divider() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Divider(
      thickness: 1.5,
    ),
  );
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final List<Widget> imgList = [
    EventScreen(),
    EventScreen(),
    EventScreen(),
    EventScreen(),
    EventScreen(),
  ];

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text("Discover Events", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,color: Colors.black),),
            ),
            divider(),
            SizedBox(height: 25,),
            CarouselSlider(
              items: imgList.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: EventScreen(),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                  height: 260.0,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              carouselController: _carouselController,
            ),
            SizedBox(height: 4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _carouselController.jumpToPage(entry.key),
                  child: Container(
                    width: 9.0,
                    height: 9.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text("Online Events", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,color: Colors.black),),
            ),
            divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // padding: const EdgeInsets.only(left:15),
              child: Row(
                children: [
                  OnlineEventScreen(),
                  OnlineEventScreen(),
                  OnlineEventScreen(),
                  OnlineEventScreen(),
                  OnlineEventScreen(),
                ],
              ),
            ),
            SizedBox(height: 25,),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text("Offline Events", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,color: Colors.black),),
            ),
            divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // padding: const EdgeInsets.only(left:20),
              child: Row(
                children: [
                  OfflineEventScreen(),
                  OfflineEventScreen(),
                  OfflineEventScreen(),
                  OfflineEventScreen(),
                  OfflineEventScreen(),
                ],
              ),
            ),
            SizedBox(height: 25,),
          ],
        )

    );
  }
}

