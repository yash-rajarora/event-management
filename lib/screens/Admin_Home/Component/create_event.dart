import 'package:dotted_border/dotted_border.dart';
import 'package:event/screens/Database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter_launcher_icons/constants.dart';


const kPrimaryColor = Color.fromRGBO(58, 107, 53, 1);
const kPrimaryLightColor = Color.fromRGBO(203, 209, 143,0.7);

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
    print(".. number of items ${_journals.length}");
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();


  // Insert a new journal to the database
  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text, _descriptionController.text,
        _locationController.text, _timeController.text);
    _refreshJournals();

    print("item inserted");
    print("Title  : ${_titleController.text}");
    print("Description  : ${_descriptionController.text}");
    print("Location  : ${_locationController.text}");
    print("Time  : ${_timeController.text}");
  }


  void _showForm(int? id) async {
    if (id != null) {
      final existingJournal =
      _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
      _locationController.text = existingJournal['location'];
      _timeController.text = existingJournal['time'];
    }
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) =>
            Container(
              height: 800,
              child:ListView(
                  children: [
                    SizedBox(height: 40),
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
                        controller: _descriptionController,
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
                        controller: _locationController,
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
                        controller: _timeController,
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
                        child:FloatingActionButton.extended(onPressed: ()async {
                          if (id == null) {
                            await _addItem();
                          }
                        },
                          label: Text('Create' , style: TextStyle(color: Colors.white,fontSize: 20),),backgroundColor: kPrimaryColor,)
                    ),
                    SizedBox(height: 20,),
                  ]
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          :ListView.builder(
        itemCount: _journals.length,
        itemBuilder: (context,index) =>
            Container(
              width: screenWidth*0.92,
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
              margin: const EdgeInsets.only(right: 15, top: 5, left: 15),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(40),
                // image: DecorationImage(
                // image: AssetImage("assets/images/cat2.jpg"),
                // fit: BoxFit.cover
                // ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 170, right: 170,left: 20,bottom: 10),
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
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0) ),
                                    // image: DecorationImage(
                                    // image: AssetImage("assets/images/cat2.jpg"),
                                    // fit: BoxFit.cover
                                    // ),
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                  child: Column(
                                      children: [
                                        Text(_journals[index]['title'],
                                          style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 15,),
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            Icon(FluentSystemIcons.ic_fluent_clock_regular, color: Colors.black,size: 20,),
                                            SizedBox(width: 17,),
                                            Text(_journals[index]['time'], style: TextStyle(color: Colors.black),)
                                          ],
                                        ),
                                        SizedBox(height: 15,),
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            Icon(FluentSystemIcons.ic_fluent_location_regular, color: Colors.black,size: 20,),
                                            SizedBox(width: 17,),
                                            Expanded(child: Text(_journals[index]['location'], style: TextStyle(color: Colors.black) ,maxLines: 2,),)
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
                                              Expanded(child: Text(_journals[index]['description'], style: TextStyle(color: Colors.black),maxLines: 20,))
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
            ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}