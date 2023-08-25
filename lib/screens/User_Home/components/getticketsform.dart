import 'package:event/screens/User_Home/components/online_events.dart';
import 'package:event/screens/User_Home/home.dart';
import 'package:event/utils/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GetTickets extends StatefulWidget {
  @override
  _GetTicketsState createState() => _GetTicketsState();
}

class _GetTicketsState extends State<GetTickets> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _phone = '';
  String _year = '';
  String _branch = '';

  Future<Database> _openDatabase() async {
    final databasePath = await getDatabasesPath();
    final database = openDatabase(
      join(databasePath, 'user_database.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY,
            name TEXT,
            email TEXT,
            phone TEXT,
            year TEXT,
            branch TEXT
          )
          ''');
      },
      version: 1,
    );
    return database;
  }

  void _saveData() async {
    final database = await _openDatabase();
    await database.insert(
      'users',
      {
        'name': _name,
        'email': _email,
        'phone': _phone,
        'year': _year,
        'branch': _branch,
      },
    );
    print('Data saved to database');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 100),
            Text("Enter your data", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: kPrimaryColor),),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.person),
                    ),
                    fillColor: kPrimaryLightColor,
                    // Change to your desired color
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.email),
                    ),
                    fillColor: kPrimaryLightColor,
                    // Change to your desired color
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Phone number',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.phone),
                    ),
                    fillColor: kPrimaryLightColor,
                    // Change to your desired color
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Year',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.book),
                    ),
                    fillColor: kPrimaryLightColor,
                    // Change to your desired color
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Branch',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.computer),
                    ),
                    fillColor: kPrimaryLightColor,
                    // Change to your desired color
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      _saveData(); // Wait for data saving to complete
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BottomBar()), // Replace with your desired screen
                      );
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
