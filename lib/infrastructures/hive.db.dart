import 'package:hive/hive.dart';
import 'package:todo_flutter_demo/entities/todo.entity.dart';

class HiveInfra {
  static const boxName = "todo-box";
  late Box<TodoEntity> todoBox;
  late List<TodoEntity> _cacheTodos;

  HiveInfra() {
    todoBox = Hive.box<TodoEntity>(HiveInfra.boxName);
  }

  Future<List<TodoEntity>> getAllTodos() async {
    List<TodoEntity> allTodos =
        todoBox.keys.map<TodoEntity>((key) => todoBox.get(key)!).toList();
    _cacheTodos = allTodos;
    return _cacheTodos;
  }

  Future<void> updateTodo(TodoEntity todo) async {
    final indexOfCurrentTodo = _cacheTodos.indexOf(todo);
    _cacheTodos[indexOfCurrentTodo] = todo;
    return todoBox.put(todo.id, todo);
  }

  Future<void> removeTodo(TodoEntity todo) async {
    _cacheTodos = _cacheTodos.where((todoE) => todoE.id != todo.id).toList();
    return todoBox.delete(todo.id);
  }

  Future<TodoEntity?> getTodo(String id) async {
    final indexOfCurrentTodo = _cacheTodos.indexWhere((todo) => todo.id == id);
    if (indexOfCurrentTodo == -1) {
      // Not found in cache
      final loadTodo = todoBox.get(id);
      if (loadTodo == null) {
        return null;
      }
      return loadTodo;
    }
    return _cacheTodos.elementAt(indexOfCurrentTodo);
  }
}
