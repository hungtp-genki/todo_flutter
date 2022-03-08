import 'package:todo_flutter_demo/entities/todo.entity.dart';
import 'package:todo_flutter_demo/utils/gen.dart';

class TodoFactory {
  TodoEntity create() {
    final newTodoId = genNewId();
    return TodoEntity(newTodoId);
  }
}
