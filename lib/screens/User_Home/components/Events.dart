import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class EventScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const EventScreen({Key? key, required this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Extract the required data from the passed map
    String imagePath = data['Image URL']; // Change this to the key used in Firestore
    String title = data['Event Name']; // Change this based on your Firestore structure
    // ... (add other data fields as needed)

    return Container(
      width: 500,
      height: 260,
      margin: const EdgeInsets.only(right: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(data['Image URL'],),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 200, right: 170, left: 20, bottom: 20),
        child: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Container(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0)),
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
                                  Text(title,
                                    style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      SizedBox(width: 20,),
                                      Icon(FluentSystemIcons.ic_fluent_clock_regular, color: Colors.black,size: 20,),
                                      SizedBox(width: 17,),
                                      Text(data['Date & Time'], style: TextStyle(color: Colors.black),)
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      SizedBox(width: 20,),
                                      Icon(FluentSystemIcons.ic_fluent_location_regular, color: Colors.black,size: 20,),
                                      SizedBox(width: 17,),
                                      Expanded(child: Text(data['Location'], style: TextStyle(color: Colors.black) ,maxLines: 2,),)
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      SizedBox(width: 20,),
                                      Icon(FluentSystemIcons.ic_fluent_globe_regular, color: Colors.black,size: 20,),
                                      SizedBox(width: 17,),
                                      Expanded(child: Text(data['mode'], style: TextStyle(color: Colors.black) ,maxLines: 2,),)
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      SizedBox(width: 20,),
                                      Text("Description", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    child: Row(
                                      children: [
                                        Expanded(child: Text(data['Description'], style: TextStyle(color: Colors.black),maxLines: 20,))
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  FloatingActionButton.extended(onPressed: (){}, label: Text('Get A Ticket' , style: TextStyle(color: Colors.white),), backgroundColor: Colors.black, ),
                                  SizedBox(height: 25,),
                                ]
                            ),
                          )
                        ],
                      ),
                    )
                ),
              );
            },
                          // Text(
                          //   title,
                          //   style: TextStyle(
                          //       fontSize: 24,
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.bold),
                          // ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
              ),
              isScrollControlled: true,
            );
          },
          label: Text(
            'Learn More',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
