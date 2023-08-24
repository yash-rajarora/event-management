import 'package:event/components/already_have_an_account_acheck.dart';
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
        height: 340,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        // margin: const EdgeInsets.only(right: 1, top: 5),
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: screenWidth*0.45,
                  height: 250,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/discover_poster.png"
                    )
                    )
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
                          style: TextStyle(fontSize: 20, color: Colors.black,),maxLines: 2,
                        ),
                      ),

                      SizedBox(height: 22,),
                      Row(
                        children: [
                          Icon(FluentSystemIcons.ic_fluent_clock_regular, color: Colors.black,size: 15,),
                          SizedBox(width: 5,),
                          Expanded(child:Text("1 - 3 January 2023", style: TextStyle(color: Colors.black , fontSize: 15),maxLines: 4,)
                          ),],
                      ),
                      SizedBox(height: 22,),
                      Row(
                        children: [
                          Icon(FluentSystemIcons.ic_fluent_location_regular, color: Colors.black,size: 15,),
                          SizedBox(width: 5,),
                          Expanded(child: Text("JECRC Foundation,A- Block Auditorium", style: TextStyle(color: Colors.black, fontSize: 15) ,maxLines: 4,),)
                        ],
                      ),
                      SizedBox(height: 32,),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Column(
              children: [
                SizedBox(
                  width: 500,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                    style: ElevatedButton.styleFrom(
                        elevation: 12.0,
                        backgroundColor: Colors.white,
                        textStyle: const TextStyle(color: Colors.black)),
                    child: const Text('Get a ticket', style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                )
              ],
            )
          ],
        )

    );
  }
}
