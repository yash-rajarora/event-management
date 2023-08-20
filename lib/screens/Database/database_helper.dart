import 'package:event/screens/Database/user_model.dart';
import 'package:event/screens/Database/user_Repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController locationController = TextEditingController();
final TextEditingController dntController = TextEditingController();
final TextEditingController descController = TextEditingController();

class DatabaseHandler {
  static final DatabaseHandler _instance = DatabaseHandler._internal();
  Database? _database;

  factory DatabaseHandler() {
    return _instance;
  }

  DatabaseHandler._internal();

  Future<Database?> openDB() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'user.db'),
    );

    return _database;
  }

  // Define a method to get the opened database instance
  Database? getDatabase() {
    return _database;
  }
}

Future<void> insertDB() async {
  Database? _database = await DatabaseHandler().openDB();

  UserRepo userRepo = new UserRepo();
  userRepo.createTable(_database);

  UserModel userModel = new UserModel(
    nameController.text.toString(),
    locationController.text.toString(),
    dntController.text.toString(),
    descController.text.toString(),
  );
  print('Inserting data into database:');
  print('Name: ${userModel.name}');
  print('Location: ${userModel.location}');
  print('Date and Time: ${userModel.dnt}');
  print('Description: ${userModel.desc}');


  await _database?.insert('User', userModel.toMap());

  await _database?.close();
}

Future<List<UserModel>> getFromUser() async {
  Database? _database = await DatabaseHandler().openDB();

  UserRepo userRepo = new UserRepo();
  List<UserModel> users = (await userRepo.getUsers(_database)).cast<UserModel>();

  await _database?.close();

  print('Retrieved users:');
  for (var user in users) {
    print('Name: ${user.name}');
    print('Location: ${user.location}');
    print('Date and Time: ${user.dnt}');
    print('Description: ${user.desc}');
  }

  return users;
}
