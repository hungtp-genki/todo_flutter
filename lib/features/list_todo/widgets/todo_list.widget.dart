// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter_demo/features/list_todo/widgets/todo_item.widget.dart';

import '../../../controllers/todo.controller.dart';

class TodoListWidget extends StatelessWidget {
  TodoListWidget({Key? key}) : super(key: key);

  final _todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: _todoController.todos.value.length,
        itemBuilder: (context, index) {
          final todo = _todoController.todos.value.elementAt(index);
          return TodoItem(todo.id, todo.name);
        },
      ),
    );
  }
}
