import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_todo/course_model.dart';
import 'package:sqflite_todo/model.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String dbName = 'User.db';

  ///=============================================Creates a table with these columns===================================

  static Future<Database> getDB() async {
    return openDatabase(join(await getDatabasesPath(), dbName),
        onCreate: (db, version) async {
          await db.execute(
              "CREATE TABLE User(id INTEGER PRIMARY KEY, name TEXT NOT NULL, phone TEXT NOT NULL, address TEXT NOT NULL);");
          await db.execute(
              "CREATE TABLE UserCourse(id INTEGER PRIMARY KEY, user_id INTEGER NOT NULL, course_title TEXT NOT NULL, course_code TEXT NOT NULL, course_credit REAL NOT NULL);");
        }, version: _version);
  }

  ///==============================================Adding User & Courses========================================================

  static Future<int> addUser(User user) async {
    final db = await getDB();
    return await db.insert("User", user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> addCourses(UserCourse course) async {
    final db = await getDB();
    return await db.insert("UserCourse", course.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///============================================Updating User and Courses=======================================================

  static Future<int> updateUser(User user) async {
    final db = await getDB();
    return await db.update("User", user.toJson(),
        where: 'id=?',
        whereArgs: [user.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateUserCourse(UserCourse course, int userId) async {
    final db = await getDB();
    return await db.update('UserCourse', course.toJson(),
        where: 'id=?',
        whereArgs: [course.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///=============================================Deleting a user and courses====================================================

  static Future<int> deleteUser(User user) async {
    final db = await getDB();
    return await db.delete("User", where: "id=?", whereArgs: [user.id]);
  }

  static Future<int> deleteUserCourse(UserCourse course, int userId) async {
    final db = await getDB();
    return await db
        .delete("UserCourse", where: "id=?", whereArgs: [course.id]);
  }

  ///===========================================Get all the users and courses====================================================

  static Future<List<User>?> getAllUser() async {
    final db = await getDB();
    final List<Map<String, dynamic>> userList = await db.query("User");
    if (userList.isEmpty) {
      return null;
    }
    return List.generate(
        userList.length, (index) => User.fromJson(userList[index]));
  }

  static Future<List<UserCourse>?> getAllUserCourse(int userId) async {
    final db = await getDB();
    final List<Map<String, dynamic>> userCourseList =
        await db.query("UserCourse", where: "user_id=?", whereArgs: [userId]);
    return List.generate(userCourseList.length,
        (index) => UserCourse.fromJson(userCourseList[index]));
  }

  ///===================================get all info one function========================================

  static Future<List<Map<String, dynamic>>> getAllInformation() async {
    final db = await getDB();
    final List<Map<String, dynamic>> userList = await db.query("User");
    final List<Map<String, dynamic>> userCourseList =
        await db.query("UserCourse");
    return [...userList, ...userCourseList];
  }
}
