// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/todo.controller.dart';

class CountTodoWidget extends StatelessWidget {
  CountTodoWidget({Key? key}) : super(key: key);

  final _todoController = Get.find<TodoController>();

  onClearAllTodos() {
    _todoController.clearAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final _task = _todoController.todos.value.length > 1 ? "tasks" : "task";
        final _length = _todoController.todos.value.length;
        return Row(
          children: [
            Expanded(child: Text("You have $_length pending $_task")),
            ElevatedButton(
              onPressed: onClearAllTodos,
              child: Text("Clear All"),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(140, 77, 236, 1),
                elevation: 0,
                padding: const EdgeInsets.all(16),
              ),
            )
          ],
        );
      },
    );
  }
}
