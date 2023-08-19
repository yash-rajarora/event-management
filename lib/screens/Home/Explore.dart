import 'package:event/components/already_have_an_account_acheck.dart';
import 'package:flutter/material.dart';
import 'package:event/screens/Home/components/ExploreEvent.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Text("Explore", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,color: kPrimaryColor),),
            ),
            SizedBox(height: 20),
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

