// import 'dart:convert';
//
// import 'package:dotted_border/dotted_border.dart';
// import 'package:event/constants.dart';
// import 'package:event/screens/Database/database_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import'package:fluentui_icons/fluentui_icons.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// const kPrimaryColor = Color.fromRGBO(58, 107, 53, 1);
// const kPrimaryLightColor = Color.fromRGBO(203, 209, 143,0.7);
//
// class AddEventImage extends StatelessWidget {
//   const AddEventImage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: defaultPadding * 2),
//         Text(
//
//           "ADD EVENT",
//           style: TextStyle(
//             fontWeight: FontWeight.w700,
//             fontSize: 20,
//             color: kPrimaryColor,
//
//           ),
//         ),
//         SizedBox(height: defaultPadding),
//         Row(
//           children: [
//             const Spacer(),
//             Expanded(
//               flex: 8,
//               child: SvgPicture.asset("assets/icons/add_event.svg"),
//             ),
//             const Spacer(),
//           ],
//         ),
//         SizedBox(height: defaultPadding * 2),
//       ],
//     );
//   }
// }
//
// class CreateEvent extends StatefulWidget {
//   const CreateEvent({super.key});
//
//   @override
//   State<CreateEvent> createState() => _CreateEventState();
// }
//
// class _CreateEventState extends State<CreateEvent> {
//   String _base64Image = "";
//   ImageProvider? _uploadedImage;  // Add this line
//   bool _hasUploaded = false;
//   Future<void> _uploadImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);  // Use pickImage instead of getImage
//
//     if (pickedFile != null) {
//       final imageBytes = await pickedFile.readAsBytes();
//       final base64Image = base64Encode(imageBytes);
//
//       setState(() {
//         _base64Image = base64Image;
//         _uploadedImage = Image.memory(imageBytes).image;
//         _hasUploaded = true;
//       });
//     }
//   }
//
//
//   List<Map<String, dynamic>> _journals = [];
//
//   bool _isLoading = true;
//
//   void _refreshJournals() async {
//     final data = await SQLHelper.getItems();
//     setState(() {
//       _journals = data;
//       _isLoading = false;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _refreshJournals();
//     print(".. number of items ${_journals.length}");
//   }
//
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//   final TextEditingController _timeController = TextEditingController();
//
//
//   // Insert a new journal to the database
//   Future<void> _addItem() async {
//     await SQLHelper.createItem(
//         _titleController.text, _descriptionController.text,
//         _locationController.text, _timeController.text);
//     _refreshJournals();
//
//     print("item inserted");
//     print("Title  : ${_titleController.text}");
//     print("Description  : ${_descriptionController.text}");
//     print("Location  : ${_locationController.text}");
//     print("Time  : ${_timeController.text}");
//
//   }
//   Future<void> _deleteEvent(int id) async{
//     await SQLHelper.deleteEvent(id);
//     _refreshJournals();
//     Navigator.pop(context);
//   }
//
//
//   void _showForm(int? id) async {
//     if (id != null) {
//       final existingJournal =
//       _journals.firstWhere((element) => element['id'] == id);
//       _titleController.text = existingJournal['title'];
//       _descriptionController.text = existingJournal['description'];
//       _locationController.text = existingJournal['location'];
//       _timeController.text = existingJournal['time'];
//     }
//     showModalBottomSheet(
//       context: context,
//       elevation: 5,
//       isScrollControlled: true,
//       builder: (_) => SingleChildScrollView(
//         child: Container(
//           height: 800,
//           child:Column(
//               children: [
//                 SizedBox(height: 40),
//                 Container(
//                   child: Container(
//                     padding: EdgeInsets.only(left: 35),
//                     child: Text("Create Event", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: kPrimaryColor),),
//                   ),
//                 ),
//                 SizedBox(height: 30,),
//                 Container(
//                   padding: const EdgeInsets.only(left: 30, right: 30),
//                   child: TextFormField(
//                     controller: _titleController,
//                     decoration: InputDecoration(
//                       hintText: 'Event Name',
//                       prefixIcon: Padding(
//                         padding: EdgeInsets.all(16),
//                         child: Icon(Icons.person),
//                       ),
//                       fillColor: kPrimaryLightColor, // Change to your desired color
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//                 Container(
//                   padding: const EdgeInsets.only(left: 30, right: 30),
//                   child: TextFormField(
//                     controller: _descriptionController,
//                     decoration: InputDecoration(
//                       hintText: 'Location',
//                       prefixIcon: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Icon(Icons.location_on),
//                       ),
//                       fillColor: kPrimaryLightColor, // Change to your desired color
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//                 Container(
//                   padding: const EdgeInsets.only(left: 30, right: 30),
//                   child: TextFormField(
//                     controller: _locationController,
//                     decoration: InputDecoration(
//                       hintText: 'Date & Time',
//                       prefixIcon: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Icon(Icons.description_outlined),
//                       ),
//                       fillColor: kPrimaryLightColor, // Change to your desired color
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//                 Container(
//                   padding: const EdgeInsets.only(left: 30, right: 30),
//                   child: TextFormField(
//                     controller: _timeController,
//                     decoration: InputDecoration(
//                       hintText: 'Description',
//                       prefixIcon: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Icon(Icons.access_time),
//                       ),
//                       fillColor: kPrimaryLightColor, // Change to your desired color
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//                 Container(
//                   height: 250,
//                   margin: const EdgeInsets.only(right: 30, top: 5, left: 30),
//                   child: DottedBorder(
//                     radius: Radius.circular(50),
//                     color: kPrimaryColor,//color of dotted/dash line
//                     strokeWidth: 1.5, //thickness of dash/dots
//                     dashPattern: [10,6],
//                     //dash patterns, 10 is dash width, 6 is space width
//                     child: Container(  //inner container
//                       height:250, //height of inner container
//                       width: double.infinity, //width to 100% match to parent container.
//                       color:kPrimaryLightColor ,
//                       child: Container(
//                         height: 250,
//                         width: double.infinity,
//                         color: kPrimaryLightColor,
//                         child: Column(
//                           children: [
//                             SizedBox(height: 20),
//                             if (_hasUploaded && _uploadedImage != null)  // Display uploaded image
//                               Expanded(
//                                 child: FittedBox(
//                                   fit: BoxFit.contain,  // Fit the image within the available space
//                                   child: Image(image: _uploadedImage!),
//                                 ),
//                               ),
//                             if (!_hasUploaded || _uploadedImage == null)  // Show only when no image is uploaded
//                               Column(
//                                 children: [
//                                   Text(
//                                     "Upload Image of Event",
//                                     style: TextStyle(fontSize: 20, color: kPrimaryColor),
//                                   ),
//                                   SizedBox(height: 20),
//                                   Icon(FluentSystemIcons.ic_fluent_upload_regular, color: kPrimaryColor, size: 50),
//                                 ],
//                               ),
//                             SizedBox(height: 20),
//                             if (!_hasUploaded || _uploadedImage == null)  // Show only when no image is uploaded
//                               FloatingActionButton.extended(
//                                 onPressed: _uploadImage,
//                                 label: Text('Upload Image', style: TextStyle(color: Colors.white)),
//                                 backgroundColor: kPrimaryColor,
//                               ),
//                           ],
//                         ),
//                       ),
//                       //background color of inner container
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30,),
//                 Container(
//                   padding: const EdgeInsets.only(left: 30, right: 30),
//                   child:FloatingActionButton.extended(
//                     onPressed: () async {
//                       if (id == null) {
//                         await _addItem();
//                       }
//                       Navigator.pushNamed(context, 'admin_home');
//                     },
//                     label: Text(
//                       'Create',
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                     ),
//                     backgroundColor: kPrimaryColor,
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//               ]
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const AddEventImage(),
//           Row(
//             children: [
//               Spacer(),
//               Expanded(
//                 flex: 8,
//                 child: Hero(
//                   tag: "login_btn",
//                   child: ElevatedButton(
//                     onPressed: () => _showForm(null),
//                     child: Text(
//                       "add event".toUpperCase(),
//                     ),
//                   ),
//                 ),
//               ),
//               Spacer(),
//             ],
//           ),
//         ],
//       );
//   }
//
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
