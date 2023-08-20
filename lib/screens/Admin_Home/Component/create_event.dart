import 'package:dotted_border/dotted_border.dart';
import 'package:event/screens/Database/database_helper.dart';
import 'package:event/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

// const kPrimaryColor = Color.fromRGBO(58, 107, 53, 1);
const kPrimaryLightColor = Color.fromRGBO(203, 209, 143,0.8);
const kPrimaryLightColor2 = Color.fromRGBO(203, 209, 143,0.4);

final List<String> items = [
  'Online',
  'Offline',
];
String? selectedValue;

List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
  final List<DropdownMenuItem<String>> menuItems = [];
  for (final String item in items) {
    menuItems.addAll(
      [
        DropdownMenuItem<String>(
          value: item,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        //If it's last item, we will not add Divider after it.
        if (item != items.last)
          const DropdownMenuItem<String>(
            enabled: false,
            child: Divider(),
          ),
      ],
    );
  }
  return menuItems;
}

List<double> _getCustomItemsHeights() {
  final List<double> itemsHeights = [];
  for (int i = 0; i < (items.length * 2) - 1; i++) {
    if (i.isEven) {
      itemsHeights.add(40);
    }
    //Dividers indexes will be the odd indexes
    if (i.isOdd) {
      itemsHeights.add(4);
    }
  }
  return itemsHeights;
}

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            SizedBox(height: 30),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text("Create Event", style: TextStyle(fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Event Name',
                  fillColor: kPrimaryLightColor, // Change to your desired color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Location',
                  fillColor: kPrimaryLightColor, // Change to your desired color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Date & Time',
                  fillColor: kPrimaryLightColor, // Change to your desired color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Description',
                  fillColor: kPrimaryLightColor, // Change to your desired color
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 250,
              margin: const EdgeInsets.only(right: 30, top: 5, left: 30),
              child: DottedBorder(
                radius: Radius.circular(50),
                color: kPrimaryColor,//color of dotted/dash line
                strokeWidth: 1.5, //thickness of dash/dots
                dashPattern: [10,6],
                //dash patterns, 10 is dash width, 6 is space width
                child: Container(  //inner container
                  height:250, //height of inner container
                  width: double.infinity, //width to 100% match to parent container.
                  color:kPrimaryLightColor ,
                  child: Column(
                    children: [
                      SizedBox(height: 20),SizedBox(height: 20),
                      Text("Upload Image of Event", style: TextStyle(fontSize: 20, color: kPrimaryColor),),
                      SizedBox(height: 20),
                      Icon(FluentSystemIcons.ic_fluent_upload_regular, color: kPrimaryColor, size: 50,),
                      SizedBox(height: 20),
                      FloatingActionButton.extended(onPressed: (){}, label: Text('Upload Image' , style: TextStyle(color: Colors.white),),backgroundColor: kPrimaryColor,)
                    ],
                  ),
                  //background color of inner container
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child:FloatingActionButton.extended(onPressed: (){
                  insertDB();
                }, label: Text('Create' , style: TextStyle(color: Colors.white,fontSize: 20),),backgroundColor: kPrimaryColor,)
            ),
            SizedBox(height: 30,),
            Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child:FloatingActionButton.extended(onPressed: (){
                  getFromUser();
                }, label: Text('Read Data' , style: TextStyle(color: Colors.white,fontSize: 20),),backgroundColor: kPrimaryColor,)
            ),
          ]
      ),
    );
  }
}
