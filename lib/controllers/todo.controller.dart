import 'package:get/get.dart';
import 'package:todo_flutter_demo/entities/todo.entity.dart';
import 'package:todo_flutter_demo/features/add_todo/todo.factory.dart';
import 'package:todo_flutter_demo/services/todo.service.dart';

class TodoController extends GetxController {
  Rx<List<TodoEntity>> todos = Rx([]);
  final currentTodoName = "".obs;
  late TodoService _todoService;

  TodoController() {
    _todoService = TodoService();
    loadTodos();
  }

  loadTodos() async {
    final loadTodos = await _todoService.allTodos();
    todos.value = loadTodos;
  }

  updateCurrentTodoName(String newName) {
    currentTodoName.value = newName;
  }

  addTodo() async {
    try {
      final newTodo = TodoFactory().create();
      newTodo.name = currentTodoName.value;
      final newTodos = await _todoService.addHead(newTodo);
      todos.value = newTodos;
    } catch (err) {
      rethrow;
    }
  }

  clearAllTodos() async {
    try {
      final newTodos = await _todoService.clearAllTodos();
      todos.value = newTodos;
    } catch (err) {
      rethrow;
    }
  }

  removeTodo(String todoId) async {
    try {
      final newTodos = await _todoService.removeTodo(todoId);
      todos.value = newTodos;
    } catch (err) {
      rethrow;
    }
  }
}
