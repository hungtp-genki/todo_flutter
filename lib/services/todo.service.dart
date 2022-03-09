import 'package:todo_flutter_demo/entities/todo.entity.dart';
import 'package:todo_flutter_demo/infrastructures/hive.db.dart';

import '../features/add_todo/todo.factory.dart';

class TodoService {
  late HiveInfra _hiveInfra;
  late TodoFactory _todoFactory;
  List<TodoEntity> _todos = [];

  TodoService() {
    _hiveInfra = HiveInfra();
    _todoFactory = TodoFactory();
  }

  TodoEntity newTodo() {
    return _todoFactory.create();
  }

  Future<List<TodoEntity>> addHead(TodoEntity todo) async {
    try {
      await _hiveInfra.addTodo(todo);
      _todos = [todo, ..._todos];
      return _todos;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<TodoEntity>> updateTodo(TodoEntity todo) async {
    try {
      await _hiveInfra.updateTodo(todo);
      final indexOfTodo = _todos.indexOf(todo);
      _todos[indexOfTodo] = todo;
      return _todos;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<TodoEntity>> allTodos() async {
    try {
      _todos = await _hiveInfra.getAllTodos();
      return _todos;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<TodoEntity>> clearAllTodos() async {
    try {
      await _hiveInfra.clearAllTodos();
      _todos = [];
      return _todos;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<TodoEntity>> removeTodo(String todoId) async {
    try {
      await _hiveInfra.removeTodo(todoId);
      _todos = _todos.where((t) => t.id != todoId).toList();
      return _todos;
    } catch (err) {
      rethrow;
    }
  }
}
