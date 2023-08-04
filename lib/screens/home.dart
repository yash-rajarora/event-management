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
                Text("Ongoing Events", style: Styles.headLineStyle2),
              
              ],


            ),

          )
        ],
      ),
        
      
    );
  }
}