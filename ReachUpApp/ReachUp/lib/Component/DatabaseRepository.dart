import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_codegen/builder.dart';
import 'package:sqflite/sqflite.dart';

import 'package:ReachUp/Component/DatabaseCreator.dart';

part 'DatabaseRepository.g.dart';

class DatabaseRepository = _DatabaseRepository with _$DatabaseRepository;

abstract class _DatabaseRepository {
  static Future<List<Todo>> getAllTodos() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
    WHERE ${DatabaseCreator.isDeleted} == 0''';
    final data = await db.rawQuery(sql);

    @observable
    var todos = ObservableList<Todo>();

    for (final node in data) {
      add(node);
      todos.add(add(node));
    }

    return todos;
  }

  @action
  static dynamic add(Map<String, dynamic> node) {
    final todo = Todo.fromJson(node);
    return todo;
    //todos.add(todo);
  }

  static Future<Todo> getTodo(int id) async {
    final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
    WHERE ${DatabaseCreator.id} == $id''';
    final data = await db.rawQuery(sql);

    final todo = Todo.fromJson(data[0]);
    return todo;
  }

  static Future<void> addTodo(Todo todo) async {
    final sql = '''INSERT INTO ${DatabaseCreator.todoTable}
    (
       ${DatabaseCreator.id},
       ${DatabaseCreator.name},
       ${DatabaseCreator.info},
       ${DatabaseCreator.isDeleted}
    )
    VALUES
    (
       ${todo.id},
       "${todo.name}",
       "${todo.info}",
       ${todo.isDeleted ? 1 : 0}
    )''';

    final result = await db.rawInsert(sql);
    DatabaseCreator.databaseLog('Add todo', sql, null, result);
  }

  static Future<void> deleteTodo(Todo todo) async {
    final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.isDeleted} = 1
    WHERE ${DatabaseCreator.id} == ${todo.id}''';

    final result = await db.rawUpdate(sql);
    DatabaseCreator.databaseLog('Delete todo', sql, null, result);
  }

  static Future<void> updateTodo(Todo todo) async {
    final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.name} == "${todo.name}"
    WHERE ${DatabaseCreator.id} == ${todo.id}''';

    final result = await db.rawUpdate(sql);
    DatabaseCreator.databaseLog('Update todo', sql, null, result);
  }

  static Future<int> todosCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) 
    FROM ${DatabaseCreator.todoTable}''');

    int count = data[0].values.elementAt(0);
    return count;
  }
}
