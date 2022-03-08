import 'package:hive/hive.dart';
import 'package:todo_flutter_demo/entities/todo.entity.dart';
import 'package:todo_flutter_demo/errors_expections.dart';

class HiveInfra {
  static const boxName = "todo-box";
  late Box<TodoEntity> todoBox;

  HiveInfra() {
    todoBox = Hive.box<TodoEntity>(HiveInfra.boxName);
  }

  Future<List<TodoEntity>> getAllTodos() async {
    List<TodoEntity> allTodos =
        todoBox.keys.map<TodoEntity>((key) => todoBox.get(key)!).toList();
    return allTodos;
  }

  Future<void> updateTodo(TodoEntity todo) async {
    try {
      todoBox.put(todo.id, todo);
    } catch (err) {
      throw UpdateTodoError().withDetail(err.toString());
    }
  }

  Future<void> removeTodo(TodoEntity todo) async {
    try {
      todoBox.delete(todo.id);
    } catch (err) {
      throw RemoveTodoError().withDetail(err.toString());
    }
  }

  Future<TodoEntity?> getTodo(String id) async {
    try {
      final todo = todoBox.get(id);
      return todo;
    } catch (err) {
      throw GetTodoError().withDetail(err.toString());
    }
  }

  Future<void> addTodo(TodoEntity todo) async {
    try {
      return todoBox.put(todo.id, todo);
    } catch (err) {
      throw AddTodoError().withDetail(err.toString());
    }
  }

  Future<int> clearAllTodos() async {
    try {
      return todoBox.clear();
    } catch (err) {
      throw ClearAllTodoError().withDetail(err.toString());
    }
  }
}
