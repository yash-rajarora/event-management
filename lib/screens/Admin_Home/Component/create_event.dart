import 'package:dotted_border/dotted_border.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:event/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  @override
  File? _pickedImage; // This variable will hold the picked image file.
  String? _imageUrl;   // This variable will hold the URL of the uploaded image.

  File? _secondPickedImage;
  String? _secondImageUrl;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _modeController = TextEditingController();

  Future<void> pickImage() async {
    bool _hasUploaded = false;
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
        _hasUploaded = true;
      });
    }
  }
  Future<void> pickSecondImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _secondPickedImage = File(pickedImage.path);
      });
    }
  }




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
                  controller: _modeController,
                  decoration: InputDecoration(
                    hintText: 'Offline/Online',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(FluentSystemIcons.ic_fluent_globe_filled),
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
              if (_pickedImage != null) // Display uploaded image if it exists
                Container(
                  height: 310,
                  child: Column(
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.cover, // You can change this to your preferred fit
                          child: Image.file(_pickedImage!),
                        ),
                      ),
                      SizedBox(height: 20,),// Show remove image button if an image is uploaded
                      SizedBox(
                        width: 200,
                        height: 55,
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            setState(() {
                              _pickedImage = null; // Remove the uploaded image
                            });
                          },
                          backgroundColor: Colors.red,
                          label: Text('Remove Image'),

                        ),

                      ),
                    ],
                  ),
                ),

              if (_pickedImage == null)
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

                                    // Show only when no image is uploaded
                                      Column(
                                        children: [
                                          SizedBox(height: 20),
                                          Text(
                                            "Upload Image of Event",
                                            style: TextStyle(fontSize: 20, color: kPrimaryColor),
                                          ),
                                          SizedBox(height: 20),
                                          Icon(FluentSystemIcons.ic_fluent_upload_regular, color: kPrimaryColor, size: 50),
                                          SizedBox(height: 20),
                                          SizedBox(
                                            width: 200,
                                            height: 55,
                                            child: FloatingActionButton.extended(
                                              onPressed: () async {
                                                // Pick an image from the gallery
                                                await pickImage();
                                              },
                                              label: Text(
                                                'Upload Image',
                                                style: TextStyle(color: Colors.white, fontSize: 15),
                                              ),
                                              backgroundColor: kPrimaryColor,
                                            ),
                                          ),
                                        ],
                                      ),


                          SizedBox(height: 20),

                        ],
                      ),
                    ),
                    //background color of inner container
                  ),
                ),
              ),
              SizedBox(height: 20,),
              if (_secondPickedImage != null) // Display uploaded image if it exists
                Container(
                  height: 310,
                  child: Column(
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.cover, // You can change this to your preferred fit
                          child: Image.file(_secondPickedImage!),
                        ),
                      ),
                      SizedBox(height: 20,),// Show remove image button if an image is uploaded
                      SizedBox(
                        width: 200,
                        height: 55,
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            setState(() {
                              _secondPickedImage = null; // Remove the uploaded image
                            });
                          },
                          backgroundColor: Colors.red,
                          label: Text('Remove Image'),

                        ),

                      ),
                    ],
                  ),
                ),
              if (_secondPickedImage == null)
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

                            // Show only when no image is uploaded
                            Column(
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  "Upload Poster of Event",
                                  style: TextStyle(fontSize: 20, color: kPrimaryColor),
                                ),
                                SizedBox(height: 20),
                                Icon(FluentSystemIcons.ic_fluent_upload_regular, color: kPrimaryColor, size: 50),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: 200,
                                  height: 55,
                                  child: FloatingActionButton.extended(
                                    onPressed: () async {
                                      // Pick an image from the gallery
                                      await pickSecondImage();
                                    },
                                    label: Text(
                                      'Upload Image',
                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                    ),
                                    backgroundColor: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),


                            SizedBox(height: 20),

                          ],
                        ),
                      ),
                      //background color of inner container
                    ),
                  ),
                ),
                 SizedBox(height: 20,),


                 SizedBox(
                   width: 200,
                   height: 55,
                   child: FloatingActionButton.extended(
                      onPressed: () async {
                        String currentTime = DateTime.now().toLocal().toString();
                        if (user != null && _pickedImage != null) {
                          // Upload the image to Firebase Storage
                          final storageReference = FirebaseStorage.instance.ref().child('event_images/$currentTime.jpg');
                          await storageReference.putFile(_pickedImage!);

                          // Get the download URL for the uploaded image
                          final imageUrl = await storageReference.getDownloadURL();

                          final secondStorageReference = FirebaseStorage.instance
                              .ref()
                              .child('event_images/second_$currentTime.jpg');
                          await secondStorageReference.putFile(_secondPickedImage!);

                          // Get the download URL for the second uploaded image
                          final secondImageUrl = await secondStorageReference.getDownloadURL();

                          // Save the event data with the image URL to Firestore
                          await FirebaseFirestore.instance.collection('events').doc(currentTime).set({
                            'Event Name': _titleController.text,
                            'Location': _locationController.text,
                            'Date & Time': _timeController.text,
                            'Description': _descriptionController.text,
                            'mode': _modeController.text.toUpperCase(),
                            'Image URL': imageUrl,
                            'Second Image URL': secondImageUrl,// Save the image URL
                          }).then((_) {
                            Navigator.pushNamed(context, 'admin_home');
                          });
                        } else {
                          // Handle the case where the user is not signed in or no image is picked
                        }
                      },
                      label: Text(
                        'Create',
                        style: TextStyle(color: Colors.white, fontSize: 15),
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
