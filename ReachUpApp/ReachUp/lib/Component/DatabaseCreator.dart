import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_codegen/builder.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'dart:convert';

//Database db;

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider dbProvider = DatabaseProvider._();
  static Database db;

  Future<Database> get database async {
    if (db != null) {
      return db;
    }
    db = await initDatabase();
    return db;
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'ReachUpHeart.db');

    if (await Directory(dirname(path)).exists()) {
      await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }

    return path;
  }

  Future<void> onCreate(Database db, int version) async {
    await createTables(db);
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasePath('ReachUpHeart.db');
    return await openDatabase(path, version: 1, onCreate: onCreate);
  }

  /*Future<void> initDatabase() async {
    final path = await getDatabasePath('ReachUpHeart.db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }*/

  Future<void> createTables(Database db) async {
    var tables = new List(5);
    tables[0] = '''CREATE TABLE map (
              code INT PRIMARY KEY, name TEXT
           )''';
    tables[1] = '''CREATE TABLE floor (
              code INT, map INT, name TEXT
    )''';
    tables[2] = '''CREATE TABLE local (
              beacon TEXT 
    )''';
    tables[3] = '''CREATE TABLE hall (
              floor INT, map INT, hall INT
    )''';
    tables[4] = '''CREATE TABLE local_hall (
              beacon TEXT, floor INT, map INT, hall INT
    )''';

    await db.execute(tables[0]);
    await db.execute(tables[1]);
    await db.execute(tables[2]);
    await db.execute(tables[3]);
    await db.execute(tables[4]);
  }

  /* initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'ReachUpHeart.db'),
        onCreate: (db, version) async {
      await db.execute('''
         CREATE TABLE map (
              code INT PRIMARY KEY, name TEXT
           )
         CREATE TABLE floor (
              code INT, map INT, name TEXT
           )
         CREATE TABLE local (
              beacon TEXT
           )
         CREATE TABLE hall (
              floor INT, map INT, hall INT
           )
         ''');
    }, version: 1);
  } */

  /* newUser(User newUser) async {
    final db = await database;

    var res = await db.rawInsert('''
      INSERT INTO users(
        username, password
      ) VALUES (?, ?)
      ''', [newUser.username, newUser.password]);
    return res;
  } */

  /* Future<dynamic> getUser() async {
    final db = database;
    var res = await db.query("user");
    if (res.length == 0) {
      return null;
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : Null;
    }
  }
} */

/** UM EXEMPLO DE MODEL, USANDO A BIBLIOTECA CONVERT **/

/*User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String username;
  String password;

  User({
    this.username;
    this.password;
  });

  factory User.fromJson(Map<String, dynamic> json) => User (
      username: json["username"],
      password: json["password"],
  );

  Map<String, dynamic> toJson => {
    "username": username,
    "password"> password,
  };
}*/

/*class DatabaseCreator {
  static const todoTable = 'todo';
  static const id = 'id';
  static const name = 'name';
  static const info = 'info';
  static const isDeleted = 'isDeleted';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> getResult, int postOrUpdateResult]) {
    print(functionName);
    print(sql);

    if (getResult != null) {
      print(getResult);
    } else if (postOrUpdateResult != null) {
      print(postOrUpdateResult);
    }
  }*/
}
