// import 'package:event/components/already_have_an_account_acheck.dart';
// import 'package:flutter/material.dart';
// import 'components/ExploreEvent.dart';
//
// Widget divider() {
//   return const Padding(
//     padding: EdgeInsets.all(8.0),
//     child: Divider(
//       thickness: 1.5,
//     ),
//   );
// }
//
// class ExplorePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 40),
//             Container(
//               padding: EdgeInsets.only(left: 15),
//               child: Text("Explore", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,color: Colors.black),),
//             ),
//             divider(),
//             SearchBar(),
//             Expanded(
//               child: EventGrid(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SearchBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         fillColor: Colors.white,
//         hintText: 'Search...',
//         prefixIcon: Icon(Icons.search),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }
// }
//


import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'components/ExploreEvent.dart';
import 'package:event/screens/Database/database_helper.dart';

Widget divider() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Divider(
      thickness: 1.5,
    ),
  );
}

// class ExplorePage extends StatefulWidget {
//   @override
//   _ExplorePageState createState() => _ExplorePageState();
// }
//
// class _ExplorePageState extends State<ExplorePage> {
//   String searchTerm = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 40),
//             Container(
//               padding: EdgeInsets.only(left: 15),
//               child: Text(
//                 "Explore",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
//               ),
//             ),
//             divider(),
//             SearchBar(
//               onChanged: (value) {
//                 setState(() {
//                   searchTerm = value;
//                 });
//               },
//             ),
//             Expanded(
//               child: TitlesList(),
//               // child: EventGrid(searchTerm: searchTerm),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
class SearchBar extends StatelessWidget {
  final Function(String) onChanged;

  SearchBar({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: 'Search...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String searchTerm = '';

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
            SearchBar(
              onChanged: (value) {
                setState(() {
                  searchTerm = value;
                });
              },
            ),
            Expanded(
              child: TitlesList(searchTerm: searchTerm),
            ),
          ],
        ),
      ),
    );
  }
}












// class EventGrid extends StatelessWidget {
//   final String searchTerm;
//
//   EventGrid({required this.searchTerm});
//
//   // This is just a dummy method for demonstration. You'll replace this with
//   // your actual data fetching and filtering method.
//   List<String> fetchFilteredEvents() {
//     // Example list of events
//     List<String> allEvents = ['Event1', 'AnotherEvent', 'SomeOtherEvent', 'EventAgain'];
//
//     return allEvents.where((event) => event.contains(searchTerm)).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> events = fetchFilteredEvents();
//
//     // Now build your grid using this filtered list of events.
//     // For now, I'll return a simple ListView as a demonstration.
//     return ListView.builder(
//       itemCount: events.length,
//       itemBuilder: (context, index) {
//         return ListTile(title: Text(events[index]));
//       },
//     );
//   }
// }


// class TitlesList extends StatefulWidget {
//   @override
//   _TitlesListState createState() => _TitlesListState();
// }
//
// class _TitlesListState extends State<TitlesList> {
//   late List<String> titles;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchTitles();
//   }
//
//   _fetchTitles() async {
//     titles = await SQLHelper.getTitles();
//     setState(() {}); // To rebuild the widget with the fetched titles.
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: titles.length,
//       itemBuilder: (context, index) {
//         return ListTile(title: Text(titles[index]));
//       },
//     );
//   }
// }

class TitlesList extends StatefulWidget {
  final String searchTerm;

  TitlesList({required this.searchTerm});

  @override
  _TitlesListState createState() => _TitlesListState();
}

class _TitlesListState extends State<TitlesList> {
  late List<String> titles;

  @override
  void initState() {
    super.initState();
    _fetchTitles();
  }

  _fetchTitles() async {
    if (widget.searchTerm.isEmpty) {
      titles = await SQLHelper.getTitles();
    } else {
      titles = await SQLHelper.searchTitles(widget.searchTerm);
    }
    setState(() {}); // Rebuild the widget with the fetched titles.
  }

  @override
  void didUpdateWidget(TitlesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchTerm != widget.searchTerm) {
      _fetchTitles();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
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
               child:Text(titles[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
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
                            image: AssetImage("assets/images/discover_main.png"),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      child: Column(
                          children: [
                            Text("JECRC Cloud Summit 2023",
                              style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(FluentSystemIcons.ic_fluent_clock_regular, color: Colors.black,size: 20,),
                                SizedBox(width: 17,),
                                Text("1 - 3 January 2023 ( 3 Days )", style: TextStyle(color: Colors.black),)
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Icon(FluentSystemIcons.ic_fluent_location_regular, color: Colors.black,size: 20,),
                                SizedBox(width: 17,),
                                Expanded(child: Text("JECRC Foundation, A - Block Auditorium", style: TextStyle(color: Colors.black) ,maxLines: 2,),)
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
                                  Expanded(child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.", style: TextStyle(color: Colors.black),maxLines: 20,))
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
    }, label: Text('Learn More' , style: TextStyle(color: Colors.black,fontSize: 12),), backgroundColor: Colors.white, ),
                  ),
                ),
              ),


                // // Foreground widget here,
              // ),
            ],
          )
        );
      },
    );
  }
}





