import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_codegen/builder.dart';
import 'package:sqflite/sqflite.dart';

import 'package:ReachUp/Component/DatabaseCreator.dart';
import 'package:ReachUp/Component/DatabaseClasses.dart';

part 'DatabaseRepository.g.dart';

class DatabaseRepository = _DatabaseRepository with _$DatabaseRepository;

abstract class _DatabaseRepository {
  static Future<List<Floor>> getAllFloor(Floor floor) async {
    final sql = '''SELECT * FROM floor''';
    final data = await db.rawQuery(sql);

    @observable
    var floors = ObservableList<Floor>();

    for (final node in data) {
      floors.add(addFloors(node));
    }

    return floors;
  }

  @action
  static dynamic addFloors(Map<String, dynamic> node) {
    final floor = Floor.fromJson(node);
    return floor;
    //todos.add(todo);
  }

  static Future<Floor> getFloor(Floor floor, int code) async {
    final sql = '''SELECT * FROM floor
    WHERE ${floor.code} == $code''';
    final data = await db.rawQuery(sql);

    final floor = Floor.fromJson(data);
    return floor;
  }

  static Future<void> addFloor(Floor floor) async {
    final sql = '''INSERT INTO floor
    VALUES
    (
       ${floor.code},
       "${floor.name}"
    )''';

    final result = await db.rawInsert(sql);
    DatabaseCreator.databaseLog('Add floor', sql, null, result);
  }

  static Future<void> updateFloor(Floor floor, int code) async {
    final sql = '''UPDATE floor
    SET ${floor.name} = 'Andar Luiz Inácio Lula da Silva'
    WHERE ${floor.code} == $code''';

    final result = await db.rawUpdate(sql);
    DatabaseCreator.databaseLog('Update floor', sql, null, result);
  }

  static Future<void> deleteFloor(Floor floor, int code) async {
    final sql = '''DELETE FROM floor
    WHERE ${floor.code} == $code''';

    final result = await db.rawDelete(sql);
    DatabaseCreator.databaseLog('Delete floor', sql, null, result);
  }

  /* Esta consulta pode ser bem útil */
  static Future<int> floorCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) 
    FROM floor''');

    int count = data[0].values.elementAt(0);
    return count;
  }

  static Future<List<Local>> getAllLocal(Local local) async {
    final sql = '''SELECT * FROM local''';
    final data = await db.rawQuery(sql);

    @observable
    var locals = ObservableList<Local>();

    for (final node in data) {
      locals.add(addLocals(node));
    }

    return locals;
  }

  @action
  static dynamic addLocals(Map<String, dynamic> node) {
    final local = Local.fromJson(node);
    return local;
    //todos.add(todo);
  }

  static Future<Local> getLocal(Local local, int code) async {
    final sql = '''SELECT * FROM local
    WHERE ${local.code} == $code''';
    final data = await db.rawQuery(sql);

    final local = Local.fromJson(data);
    return local;
  }

  static Future<void> addLocal(Local local) async {
    final sql = '''INSERT INTO local
    VALUES
    (
       ${local.beacon}
    )''';

    final result = await db.rawInsert(sql);
    DatabaseCreator.databaseLog('Add local', sql, null, result);
  }

  static Future<void> deleteLocal(Local local, int code) async {
    final sql = '''DELETE FROM local
    WHERE ${local.code} == $code''';

    final result = await db.rawDelete(sql);
    DatabaseCreator.databaseLog('Delete local', sql, null, result);
  }

  static Future<List<Hall>> getAllHall(Hall hall) async {
    final sql = '''SELECT * FROM hall''';
    final data = await db.rawQuery(sql);

    @observable
    var halls = ObservableList<Hall>();

    for (final node in data) {
      halls.add(addHalls(node));
    }

    return halls;
  }

  @action
  static dynamic addHalls(Map<String, dynamic> node) {
    final hall = Hall.fromJson(node);
    return hall;
    //todos.add(todo);
  } 

  static Future<Hall> getHall(Hall hall, int code, int floor) async {
    final sql = '''SELECT * FROM hall
    WHERE ${hall.code} == $code
    AND ${hall.floor} == $floor''';
    final data = await db.rawQuery(sql);

    final hall = Hall.fromJson(data);
    return hall;
  }

  static Future<void> addHall(Hall hall) async {
    final sql = '''INSERT INTO hall
    VALUES
    (
       ${hall.floor},
       ${hall.code}
    )''';

    final result = await db.rawInsert(sql);
    DatabaseCreator.databaseLog('Add hall', sql, null, result);
  }

  static Future<void> deleteHall(Hall hall, int code, int floor) async {
    final sql = '''DELETE FROM hall
    WHERE ${hall.code} == $code
    AND ${hall.floor} == $floor''';

    final result = await db.rawDelete(sql);
    DatabaseCreator.databaseLog('Delete hall', sql, null, result);
  }

}
