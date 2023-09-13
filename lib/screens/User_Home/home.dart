import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'components/Events.dart';
import 'components/offline_event.dart';
import 'components/online_events.dart';


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

  double offset = 0.0;

  final PageController _controller = PageController();

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final CollectionReference collection = FirebaseFirestore.instance.collection('events');
    final screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Discover Events",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Colors.black),
                ),
              ),
            ),
            divider(),
            SizedBox(height: 10,),
            StreamBuilder<QuerySnapshot>(
              stream: collection.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final items = snapshot.data!.docs;

                return Column(
                  children: [
                    CarouselSlider(
                      items: items.map((doc) {
                        final itemData = doc.data() as Map<String, dynamic>;
                        // Assuming EventScreen accepts some kind of data, modify as needed
                        return Container(
                          width: screenWidth,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: EventScreen(data: itemData),
                        );
                      }).toList(),
                      options: CarouselOptions(
                          height: 260.0,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }
                      ),
                      carouselController: _carouselController,
                    ),
                    SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(items.length, (index) {
                        return GestureDetector(
                          onTap: () => _carouselController.jumpToPage(index),
                          child: Container(
                            width: 9.0,
                            height: 9.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme
                                  .of(context)
                                  .brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                                  .withOpacity(_current == index ? 0.9 : 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                          child:Text("Online Events", style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),),

                )

                    ),
                    divider(),

                    NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        setState(() {
                          offset = scrollNotification.metrics.pixels;
                        });
                        return true;
                      },
                      child: StreamBuilder<QuerySnapshot>(
                        stream: collection.snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }

                          final items = snapshot.data!.docs;

                          // Filter items where the mode is "Online"
                          final onlineEvents = items
                              .where((doc) {
                            final itemData = doc.data() as Map<String, dynamic>;
                            return itemData['mode'] == 'ONLINE';
                          })
                              .toList();

                          return SingleChildScrollView(
                            controller: _controller,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: onlineEvents.map((doc) {
                                final itemData = doc.data() as Map<String, dynamic>;
                                String title = itemData['Event Name'] ?? 'Default Title';

                                return OnlineEventScreen(data: itemData);
                              }).toList(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DottedIndicator(
                        offset: offset,
                        screenWidth: screenWidth,
                        itemCount: 5, // Update this to be dynamic based on Firestore data if needed
                        onTap: (index) {
                          _controller.animateTo(
                            index * screenWidth,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),


                    SizedBox(height: 25,),
                    Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child:Text("Offline Events", style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),),

                        )

                    ),
                    divider(),

                    NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        setState(() {
                          offset = scrollNotification.metrics.pixels;
                        });
                        return true;
                      },
                      child: StreamBuilder<QuerySnapshot>(
                        stream: collection.snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }

                          final items = snapshot.data!.docs;

                          // Filter items where the mode is "Online"
                          final onlineEvents = items
                              .where((doc) {
                            final itemData = doc.data() as Map<String, dynamic>;
                            return itemData['mode'] == 'OFFLINE';
                          })
                              .toList();

                          return SingleChildScrollView(
                            controller: _controller,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: onlineEvents.map((doc) {
                                final itemData = doc.data() as Map<String, dynamic>;
                                String title = itemData['Event Name'] ?? 'Default Title';

                                return OnlineEventScreen(data: itemData);
                              }).toList(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(8.0),
                      child: DottedIndicator(
                        offset: offset, screenWidth: screenWidth, itemCount: 5,
                        onTap: (index) {
                          _controller.animateTo(
                            index * screenWidth,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                );
              },
    ),
    ],
    ),
      ),
    );
  }
}

class DottedIndicator extends StatelessWidget {
  final double offset;
  final double screenWidth;
  final int itemCount;
  final Function(int) onTap;

  const DottedIndicator({
    required this.offset,
    required this.screenWidth,
    required this.itemCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    int current = (offset + screenWidth / 2) ~/ screenWidth;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return GestureDetector(
          onTap: () => onTap(index),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == current ? Colors.black : Colors.grey,
            ),
          ),
        );
      }),
    );
  }
}


