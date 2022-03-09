import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter_demo/controllers/todo.controller.dart';

class AddTodoWidget extends StatelessWidget {
  AddTodoWidget({Key? key}) : super(key: key);
  final _todoController = Get.find<TodoController>();
  final _todoNameInputController = TextEditingController();

  onAddTodo() async {
    try {
      await _todoController.addTodo();
    } finally {
      _todoNameInputController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            controller: _todoNameInputController,
            onChanged: _todoController.updateCurrentTodoName,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: onAddTodo,
          child: const Text("+"),
          style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(140, 77, 236, 1),
            elevation: 0,
            padding: const EdgeInsets.all(16),
          ),
        )
      ],
    );
  }
}
