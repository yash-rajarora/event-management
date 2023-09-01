import 'package:dotted_border/dotted_border.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:event/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  @override

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Widget build(BuildContext context) {
    // Get the current user from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 60),
              Container(
                child: Container(
                  padding: EdgeInsets.only(left: 35),
                  child: Text("Create Event", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: kPrimaryColor),),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Event Name',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.person),
                    ),
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
                  controller: _locationController,
                  decoration: InputDecoration(
                    hintText: 'Location',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(Icons.location_on),
                    ),
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
                  controller: _timeController,
                  decoration: InputDecoration(
                    hintText: 'Date & Time',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(Icons.description_outlined),
                    ),
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
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(Icons.access_time),
                    ),
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
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      color: kPrimaryLightColor,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          // if (_hasUploaded && _uploadedImage != null)  // Display uploaded image
                          //   Expanded(
                          //     child: FittedBox(
                          //       fit: BoxFit.contain,  // Fit the image within the available space
                          //       child: Image(image: _uploadedImage!),
                          //     ),
                          //   ),
                          // if (!_hasUploaded || _uploadedImage == null)  // Show only when no image is uploaded
                            Column(
                              children: [
                                Text(
                                  "Upload Image of Event",
                                  style: TextStyle(fontSize: 20, color: kPrimaryColor),
                                ),
                                SizedBox(height: 20),
                                Icon(FluentSystemIcons.ic_fluent_upload_regular, color: kPrimaryColor, size: 50),
                              ],
                            ),
                          SizedBox(height: 20),
                          // if (!_hasUploaded || _uploadedImage == null)  // Show only when no image is uploaded
                            FloatingActionButton.extended(
                              onPressed: (){},
                              label: Text('Upload Image', style: TextStyle(color: Colors.white)),
                              backgroundColor: kPrimaryColor,
                            ),
                        ],
                      ),
                    ),
                    //background color of inner container
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child:FloatingActionButton.extended(
                  onPressed: () {
                    String currentTime = DateTime.now().toLocal().toString();
                    if (user != null) { // Check if user is signed in
                      FirebaseFirestore.instance.collection('events').doc(currentTime).set({
                        'Event Name': _titleController.text,
                        'Location': _locationController.text,
                        'Date & Time': _timeController.text,
                        'Description': _descriptionController.text,
                      }).then((_) {
                        Navigator.pushNamed(context, 'admin_home');
                      });
                    } else {
                      // Handle the case where the user is not signed in
                    }

                    },
                  label: Text(
                    'Create',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  backgroundColor: kPrimaryColor,
                ),
              ),
              SizedBox(height: 20,),
            ]
        ),
      ),
    );
  }
}
