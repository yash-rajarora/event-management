import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        location TEXT,
        time TEXT,
        description TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'user.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(String title,String location, String time, String? descrption) async {
    final db = await SQLHelper.db();

    final data = {'title': title,'location': location,'time': time, 'description': descrption};
    final id = await db.insert(
        'users',
        data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('users', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('users', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Delete an event by ID
  static Future<void> deleteEvent(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('users', where: 'id = ?', whereArgs: [id]);
    } catch (err) {
      debugPrint('Something went wrong when deleting an event: $err');
    }
  }


  // Update an item by id
  static Future<int> updateItem(
      int id, String title,String location, String time, String? description) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': description,
      'location': location,
      'time': time,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('users', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

// Delete
//   static Future<void> deleteItem(int id) async {
//     final db = await SQLHelper.db();
//     try {
//       await db.delete("items", where: "id = ?", whereArgs: [id]);
//     } catch (err) {
//       debugPrint("Something went wrong when deleting an item: $err");
//     }
//   }
}