import 'package:event/utils/app_styles.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

var date = DateTime.now();
 var currentDay =  DateFormat('EEEE').format(date);
 var currentDate = DateFormat.yMMMMd('en_US').format(date);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 18, 62, 63),

      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Gap(45),
                Text(currentDay, style: Styles.headLineStyle3,),
                Gap(5),
                Text(currentDate , style: Styles.headLineStyle3,),
                Gap(25),
                Divider(color: Color.fromARGB(255, 143, 140, 140),),

                Gap(25),
                Text("Discover Events" , style: Styles.headLineStyle1,),
                Gap(25),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color.fromARGB(255, 93, 91, 91))
                    
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                  child: Row(
                        children: [
                           Icon(FluentSystemIcons.ic_fluent_search_regular ,color: Styles.textColor,),
                           SizedBox(width: 10,),
                           Text("Search Events", style: Styles.headLineStyle4,)
                        ],
                    ),
                ),
                Gap(35),
                Text("Discover Events", style: Styles.headLineStyle2),
                Gap(40),
                Container(
                  width: 400,
                  height: 225,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Align(
                        alignment: Alignment.center,
                        child:Text("JECRC Cloud Summit 2023", style: Styles.headLineStyle5, textAlign: TextAlign.center,),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Gap(20),
                          Icon(FluentSystemIcons.ic_fluent_clock_regular, color: Colors.blueGrey,size: 20,),
                          Gap(17),
                          Text("1 - 3 January 2023 ( 3 Days )", style: Styles.headLineStyle4,)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Gap(20),
                          Icon(FluentSystemIcons.ic_fluent_location_regular, color: Colors.blueGrey,size: 20,),
                          Gap(17),
                          Expanded(child: Text("JECRC Foundation,A- Block Auditorium", style: Styles.headLineStyle4 ,maxLines: 2,),)
                        ],
                      ),
                      SizedBox(height: 20,),
                      FloatingActionButton.extended(onPressed: (){}, label: Text('Get A Ticket'), backgroundColor: Color.fromARGB(225,223,187,103),),
                    ],
                  ),
                ),
                Gap(40),
                Container(
                  width: 400,
                  height: 225,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Align(
                        alignment: Alignment.center,
                        child:Text("JECRC MUN 2023", style: Styles.headLineStyle5, textAlign: TextAlign.center,),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Gap(20),
                          Icon(FluentSystemIcons.ic_fluent_clock_regular, color: Colors.blueGrey,size: 20,),
                          Gap(17),
                          Text("1 - 3 January 2023 ( 3 Days )", style: Styles.headLineStyle4,)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Gap(20),
                          Icon(FluentSystemIcons.ic_fluent_location_regular, color: Colors.blueGrey,size: 20,),
                          Gap(17),
                          Expanded(child: Text("JECRC Foundation,A- Block Auditorium", style: Styles.headLineStyle4 ,maxLines: 2,),)
                        ],
                      ),
                      SizedBox(height: 20,),
                      FloatingActionButton.extended(onPressed: (){}, label: Text('Get A Ticket'), backgroundColor: Color.fromARGB(225,223,187,103),),
                    ],
                  ),
                ),
                Gap(40),
                Container(
                  width: 400,
                  height: 225,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Align(
                        alignment: Alignment.center,
                        child:Text("JECRC Ren 2023", style: Styles.headLineStyle5, textAlign: TextAlign.center,),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Gap(20),
                          Icon(FluentSystemIcons.ic_fluent_clock_regular, color: Colors.blueGrey,size: 20,),
                          Gap(17),
                          Text("1 - 3 January 2023 ( 3 Days )", style: Styles.headLineStyle4,)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Gap(20),
                          Icon(FluentSystemIcons.ic_fluent_location_regular, color: Colors.blueGrey,size: 20,),
                          Gap(17),
                          Expanded(child: Text("JECRC Foundation,A- Block Auditorium", style: Styles.headLineStyle4 ,maxLines: 2,),)

                        ],
                      ),
                      SizedBox(height: 20,),
                      FloatingActionButton.extended(onPressed: (){}, label: Text('Get A Ticket'), backgroundColor: Color.fromARGB(225,223,187,103),),
                    ],
                  ),
                ),
                Gap(20)
              ],


            ),

          )
        ],
      ),
        
      
    );
  }
}