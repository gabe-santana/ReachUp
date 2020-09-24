import 'package:mobx_codegen/builder.dart';
import 'package:sqflite/sqflite.dart';

import 'package:ReachUp/Component/DatabaseCreator.dart';

class Map {
  int code;
  String name;

  Map(this.code, this.name);

  Map.fromJson(Map<String, dynamic> json) {
    this.code = json[DatabaseCreator.code];
    this.name = json[DatabaseCreator.name];
  }
}

class Floor {
  int code;
  int map;
  String name;

  Floor(this.code, this.map, this.name);

  Floor.fromJson(Map<String, dynamic> json) {
    this.code = json[DatabaseCreator.code];
    this.map = json[DatabaseCreator.map];
    this.name = json[DatabaseCreator.name];
  }
}

class Local {
  String beacon;

  Local(this.beacon);

  Local.fromJson(Map<String, dynamic> json) {
    this.beacon = json[DatabaseCreator.beacon];
  }
}

class Hall {
  int floor;
  int map;
  int code;

  Hall(this.floor, this.map, this.code);

  Hall.fromJson(Map<String, dynamic> json) {
    this.floor = json[DatabaseCreator.floor];
    this.map = json[DatabaseCreator.map];
    this.code = json[DatabaseCreator.code];
  }
}
