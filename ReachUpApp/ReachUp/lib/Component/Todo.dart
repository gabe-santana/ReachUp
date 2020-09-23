import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_codegen/builder.dart';
import 'package:sqflite/sqflite.dart';

import 'package:ReachUp/Component/DatabaseCreator.dart';

class Todo {
  int id;
  String name;
  String info;
  bool isDeleted;

  Todo(this.id, this.name, this.info, this.isDeleted);

  Todo.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.name = json[DatabaseCreator.name];
    this.info = json[DatabaseCreator.info];
    this.isDeleted = json[DatabaseCreator.isDeleted] == 1;
  }
}
