import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class OnlineEventScreen extends StatelessWidget {
  const OnlineEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth*0.6,
      height: 370,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 20, top: 5),
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 20,
              spreadRadius: 5,
            )
          ]
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey,
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              // image: AssetImage(
              //   "assets/image/home.png"
              // )
              // )
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Column(
              children: [
                Text("JECRC Cloud Summit",
                  style: TextStyle(fontSize: 18, color: Colors.white,),
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    SizedBox(height: 20),
                    Icon(FluentSystemIcons.ic_fluent_clock_regular, color: Colors.white,size: 15,),
                    SizedBox(height: 20),
                    Text("1 - 3 January 2023", style: TextStyle(color: Colors.white , fontSize: 15),maxLines: 3,)
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(height: 20),
                    Icon(FluentSystemIcons.ic_fluent_location_regular, color: Colors.white,size: 15,),
                    SizedBox(height: 20),
                    Expanded(child: Text("JECRC Foundation,A- Block Auditorium", style: TextStyle(color: Colors.white, fontSize: 15) ,maxLines: 2,),)
                  ],
                ),
                SizedBox(height: 15,),
                FloatingActionButton.extended(onPressed: (){}, label: Text('Get A Ticket' , style: TextStyle(color: Colors.black),), backgroundColor: Colors.white, ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
