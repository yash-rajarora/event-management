import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import '../../components/already_have_an_account_acheck.dart';

List _allResults = [];
List _resultList = [];

final TextEditingController _searchController= TextEditingController();



class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> with AutomaticKeepAliveClientMixin<ExplorePage> {

  @override
  bool get wantKeepAlive => true;
  void initState(){
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged(){
    print(_searchController.text);
    searchResultList();
  }

  searchResultList(){
    var showResult = [];
    if(_searchController.text != ""){
      for(var clientSnapShot in _allResults){
        var title = clientSnapShot['Event Name'].toString().toLowerCase();
        if(title.contains(_searchController.text.toLowerCase())){
          showResult.add(clientSnapShot);
        }
      }
    }else{
      showResult = List.from(_allResults);
    }
    setState(() {
      _resultList = showResult;
    });
  }

  getClientStream() async{
    var data  = await FirebaseFirestore.instance.collection('events').get();

    setState(() {
      _allResults = data.docs;
    });
    searchResultList();
  }

  @override
  void dispose(){
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Explore",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
              ),
            ),
            divider(),
            TextField(
            controller: _searchController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
            Expanded(
              child: ListView.builder(
                itemCount: _resultList.length,
                  itemBuilder: (context, index){
                    return
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          padding: EdgeInsets.all(5.0),
                          height: 70,
                          decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:Row(
                            children: [
                              Icon(FluentSystemIcons.ic_fluent_calendar_empty_regular),
                              SizedBox(width: 10,),
                              Container(
                                width: 175,
                                child:Text(_resultList[index]['Event Name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  child: SizedBox(
                                    height: 40,
                                    width: 100,
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
                                                          image: NetworkImage(_allResults[index]['Image URL']),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 30,),
                                                    Container(
                                                      child: Column(
                                                          children: [
                                                            Text(_resultList[index]['Event Name'],
                                                              style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
                                                            ),
                                                            SizedBox(height: 15,),
                                                            Row(
                                                              children: [
                                                                SizedBox(width: 20,),
                                                                Icon(FluentSystemIcons.ic_fluent_clock_regular, color: Colors.black,size: 20,),
                                                                SizedBox(width: 17,),
                                                                Text(_resultList[index]['Date & Time'], style: TextStyle(color: Colors.black),)
                                                              ],
                                                            ),
                                                            SizedBox(height: 15,),
                                                            Row(
                                                              children: [
                                                                SizedBox(width: 20,),
                                                                Icon(FluentSystemIcons.ic_fluent_location_regular, color: Colors.black,size: 20,),
                                                                SizedBox(width: 17,),
                                                                Expanded(child: Text(_resultList[index]['Location'], style: TextStyle(color: Colors.black) ,maxLines: 2,),)
                                                              ],
                                                            ),
                                                            SizedBox(height: 15,),
                                                            Row(
                                                              children: [
                                                                SizedBox(width: 20,),
                                                                Icon(FluentSystemIcons.ic_fluent_globe_regular, color: Colors.black,size: 20,),
                                                                SizedBox(width: 17,),
                                                                Expanded(child: Text(_resultList[index]['mode'], style: TextStyle(color: Colors.black) ,maxLines: 2,),)
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
                                                                  Expanded(child: Text(_resultList[index]['Description'], style: TextStyle(color: Colors.black),maxLines: 20,))
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(height: 15,),
                                                            FloatingActionButton.extended(onPressed: (){}, label: Text('Get A Ticket' , style: TextStyle(color: Colors.white),), backgroundColor: Colors.black, ),
                                                            SizedBox(height: 15,),
                                                            FloatingActionButton.extended(onPressed: (){}, label: Text('Share' , style: TextStyle(color: Colors.white),), backgroundColor: Colors.black, ),                                                          ]
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
                                    }, label: Text('Learn More' , style: TextStyle(color: Colors.black,fontSize: 12),), backgroundColor: Colors.white, ),
                                  ),
                                ),
                              ),


                              // // Foreground widget here,
                              // ),
                            ],
                          )
                      );
                  }),
              // child: EventGrid(searchTerm: searchTerm),
            ),
          ],
        ),
      ),
    );
  }
}

Widget divider() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Divider(
      thickness: 1.5,
    ),
  );
}


