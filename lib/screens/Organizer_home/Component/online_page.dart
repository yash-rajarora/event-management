import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class OnlinePageorg extends StatefulWidget {
  const OnlinePageorg({super.key});

  @override
  State<OnlinePageorg> createState() => _OnlinePageorgState();
}

class _OnlinePageorgState extends State<OnlinePageorg> {
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('events').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data() as Map<String, dynamic>;

              // Check if the mode is "online"
              if (data['mode'] == 'ONLINE') {
                return Container(
                  width: screenWidth * 0.92,
                  height: 250,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                  margin: const EdgeInsets.only(right: 15, top: 5, left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                      image: NetworkImage(data['Image URL']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 170, right: 170, left: 20, bottom: 10),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40.0),
                                          topRight: Radius.circular(40.0),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(data['Image URL']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30,),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            data['Event Name'],
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 15,),
                                          Row(
                                            children: [
                                              SizedBox(width: 20,),
                                              Icon(
                                                FluentSystemIcons
                                                    .ic_fluent_clock_regular,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              SizedBox(width: 17,),
                                              Text(
                                                data['Date & Time'],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15,),
                                          Row(
                                            children: [
                                              SizedBox(width: 20,),
                                              Icon(
                                                FluentSystemIcons
                                                    .ic_fluent_location_regular,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              SizedBox(width: 17,),
                                              Expanded(
                                                child: Text(
                                                  data['Location'],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  maxLines: 2,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15,),
                                          Row(
                                            children: [
                                              SizedBox(width: 20,),
                                              Icon(
                                                FluentSystemIcons
                                                    .ic_fluent_globe_regular,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              SizedBox(width: 17,),
                                              Expanded(
                                                child: Text(
                                                  "Online",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  maxLines: 2,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15,),
                                          Row(
                                            children: [
                                              SizedBox(width: 20,),
                                              Text(
                                                "Description",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    data['Description'],
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    maxLines: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 15,),
                                          SizedBox(height: 25,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          isScrollControlled: true,
                        );
                      },
                      label: Text('Learn More', style: TextStyle(
                        color: Colors.black,
                      ),),
                      backgroundColor: Colors.white,
                    ),
                  ),
                );
              } else {
                // If the mode is not "online," return an empty container or null
                return SizedBox.shrink(); // This will return an empty container
                // or
                // return null; // This will effectively remove the item from the list
              }
            }).toList(),
          );
        },
      ),
    );
  }
}
