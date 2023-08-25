import 'package:flutter/material.dart';
import 'package:event/screens/Database/database_helper.dart';
import'package:fluentui_icons/fluentui_icons.dart';

class OfflinePage extends StatefulWidget {
  const OfflinePage({super.key});

  @override
  State<OfflinePage> createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
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

  @override
  Future<void> _deleteEvent(int id) async{
    await SQLHelper.deleteEvent(id);
    _refreshJournals();
    Navigator.pop(context);
  }
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child:ListView.builder(
        itemCount: _journals.length,
        itemBuilder: (context,index) =>
            Container(
              width: screenWidth*0.92,
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
              margin: const EdgeInsets.only(right: 15, top: 5, left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                    image: AssetImage("assets/images/discover_main.png"),
                    fit: BoxFit.cover
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 170, right: 170,left: 20,bottom: 10),
                child: FloatingActionButton.extended(onPressed: (){
                  showModalBottomSheet(context: context,
                    builder: (BuildContext context){
                      return Container(
                          height: 700.0,
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0) ),
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/discover_main.png"),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                  child: Column(
                                      children: [
                                        Text(_journals[index]['title'],
                                          style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete,color: Colors.red ),
                                          onPressed: () => _deleteEvent(_journals[index]['id']),
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
      ),
    );
  }
}
