import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_todo/model.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String dbName = 'User.db';

  ///=============================================Creates a table with these columns===================================

  static Future<Database> getDB() async {
    return openDatabase(join(await getDatabasesPath(), dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE User(id INTEGER PRIMARY KEY, name TEXT NOT NULL, phone TEXT NOT NULL, address TEXT NOT NULL);"),
        version: _version);
  }

  ///==============================================Adding User========================================================

  static Future<int> addUser(User user) async {
    final db = await getDB();
    return await db.insert("User", user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///============================================Updating User=======================================================

  static Future<int> updateUser(User user) async {
    final db = await getDB();
    return await db.update("User", user.toJson(),
        where: 'id=?',
        whereArgs: [user.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///=============================================Deleting a user====================================================

  static Future<int> deleteUser(User user) async {
    final db = await getDB();
    return await db.delete("User", where: "id=?", whereArgs: [user.id]);
  }

  ///===========================================Get all the users====================================================

  static Future<List<User>?> getAllUser() async {
    final db = await getDB();
    final List<Map<String, dynamic>> userList = await db.query("User");
    if (userList.isEmpty) {
      return null;
    }
    return List.generate(
        userList.length, (index) => User.fromJson(userList[index]));
  }
}
