import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth*0.9,
      height: 260,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(
        image: AssetImage("assets/images/discover.jpg"),
        fit: BoxFit.cover
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 190, right: 140,left: 15,bottom: 20),
        child: FloatingActionButton.extended(onPressed: (){
          showModalBottomSheet(context: context,
            builder: (BuildContext context){
              return Container(
                  height: 600.0,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0) ),
                            image: DecorationImage(
                            image: AssetImage("assets/images/discover_main.png"),
                            fit: BoxFit.cover
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: Column(
                              children: [
                                Text("JECRC Cloud Summit 2023",
                                  style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    SizedBox(width: 20,),
                                    Icon(FluentSystemIcons.ic_fluent_clock_regular, color: Colors.black,size: 20,),
                                    SizedBox(width: 17,),
                                    Text("1 - 3 January 2023 ( 3 Days )", style: TextStyle(color: Colors.black),)
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    SizedBox(width: 20,),
                                    Icon(FluentSystemIcons.ic_fluent_location_regular, color: Colors.black,size: 20,),
                                    SizedBox(width: 17,),
                                    Expanded(child: Text("JECRC Foundation, A - Block Auditorium", style: TextStyle(color: Colors.black) ,maxLines: 2,),)
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    SizedBox(width: 20,),
                                    Icon(FluentSystemIcons.ic_fluent_globe_regular, color: Colors.black,size: 20,),
                                    SizedBox(width: 17,),
                                    Expanded(child: Text("Online", style: TextStyle(color: Colors.black) ,maxLines: 2,),)
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
                                      Expanded(child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.", style: TextStyle(color: Colors.black),maxLines: 20,))
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15,),
                                FloatingActionButton.extended(onPressed: (){}, label: Text('Get A Ticket' , style: TextStyle(color: Colors.white),), backgroundColor: Colors.black, ),
                              ]
                          ),
                        )
                      ],
                    ),
                  )
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0) )
            ),
            isScrollControlled: true,
          );
        }, label: Text('Learn More' , style: TextStyle(color: Colors.black),), backgroundColor: Colors.white, ),// Foreground widget here,
      ),
    );
  }
}
