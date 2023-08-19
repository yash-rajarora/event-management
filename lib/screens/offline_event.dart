import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class OfflineEventScreen extends StatelessWidget {
  const OfflineEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: 320,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 5, top: 5),
      decoration: BoxDecoration(
        color: Colors.black87,
      ),
      child: Row(
        children: [
          Container(
            width: screenWidth*0.45,
            height: 320,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              // image: AssetImage(
              //   "assets/image/home.png"
              // )
              // )
            ),
          ),
          SizedBox(width: 12,),
          Container(
            padding: const EdgeInsets.only(top: 20),
            width: screenWidth*0.4,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("JECRC Cloud Summit",
                    style: TextStyle(fontSize: 20, color: Colors.white,),maxLines: 2,
                  ),
                ),

                SizedBox(height: 22,),
                Row(
                  children: [
                    Icon(FluentSystemIcons.ic_fluent_clock_regular, color: Colors.white,size: 15,),
                    SizedBox(width: 5,),
                    Expanded(child:Text("1 - 3 January 2023", style: TextStyle(color: Colors.white , fontSize: 15),maxLines: 4,)
                    ),],
                ),
                SizedBox(height: 22,),
                Row(
                  children: [
                    Icon(FluentSystemIcons.ic_fluent_location_regular, color: Colors.white,size: 15,),
                    SizedBox(width: 5,),
                    Expanded(child: Text("JECRC Foundation,A- Block Auditorium", style: TextStyle(color: Colors.white, fontSize: 15) ,maxLines: 4,),)
                  ],
                ),
                SizedBox(height: 32,),
                FloatingActionButton.extended(onPressed: (){}, label: Text('Get A Ticket' , style: TextStyle(color: Colors.black),), backgroundColor: Colors.white, ),
              ],
            ),
          ),


        ],
      ),

    );
  }
}
