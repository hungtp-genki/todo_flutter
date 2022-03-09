import 'package:hive/hive.dart';
import 'package:todo_flutter_demo/constants.dart';
import 'package:todo_flutter_demo/entities/todo.entity.dart';
import 'package:todo_flutter_demo/errors_expections.dart';

class HiveInfra {
  static const boxName = todoBoxName;
  static late Box<TodoEntity> _todoBox;

  static openBox() async {
    _todoBox = await Hive.openBox<TodoEntity>(HiveInfra.boxName);
  }

  Future<List<TodoEntity>> getAllTodos() async {
    List<TodoEntity> allTodos =
        _todoBox.keys.map<TodoEntity>((key) => _todoBox.get(key)!).toList();
    return allTodos;
  }

  Future<void> updateTodo(TodoEntity todo) async {
    try {
      _todoBox.put(todo.id, todo);
    } catch (err) {
      throw UpdateTodoError().withDetail(err.toString());
    }
  }

  Future<void> removeTodo(String todoId) async {
    try {
      _todoBox.delete(todoId);
    } catch (err) {
      throw RemoveTodoError().withDetail(err.toString());
    }
  }

  Future<TodoEntity?> getTodo(String id) async {
    try {
      final todo = _todoBox.get(id);
      return todo;
    } catch (err) {
      throw GetTodoError().withDetail(err.toString());
    }
  }

  Future<void> addTodo(TodoEntity todo) async {
    try {
      return _todoBox.put(todo.id, todo);
    } catch (err) {
      throw AddTodoError().withDetail(err.toString());
    }
  }

  Future<int> clearAllTodos() async {
    try {
      return _todoBox.clear();
    } catch (err) {
      throw ClearAllTodoError().withDetail(err.toString());
    }
  }
}
