import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_codegen/builder.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DatabaseCreator {
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
  }

  Future<void> createTodoTable(Database db) async {
    final tableSQL = '''CREATE TABLE $todoTable
    (
       $id INTEGER PRIMARY KEY,
       $name TEXT,
       $info TEXT,
       $isDeleted BIT NOT NULL
    )''';

    await db.execute(tableSQL);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    if (await Directory(dirname(path)).exists()) {
      await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }

    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('todo_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createTodoTable(db);
  }
}
