import 'package:get/get.dart';
import 'package:todo_flutter_demo/entities/todo.entity.dart';
import 'package:todo_flutter_demo/services/todo.service.dart';

class TodoController extends GetxController {
  Rx<List<TodoEntity>> todos = Rx([]);
  late TodoService _todoService;
  TodoController() {
    _todoService = TodoService();
  }

  loadTodos() async {
    final loadTodos = await _todoService.allTodos();
    todos.value = loadTodos;
  }
}
