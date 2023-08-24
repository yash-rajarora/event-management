import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:flutter/material.dart';
import 'components/ExploreEvent.dart';

Widget divider() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Divider(
      thickness: 1.5,
    ),
  );
}

class ExplorePage extends StatelessWidget {
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
              child: Text("Explore", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,color: Colors.black),),
            ),
            divider(),
            SearchBar(),
            Expanded(
              child: EventGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
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

