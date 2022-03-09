// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_flutter_demo/controllers/todo.controller.dart';

class TodoItem extends StatelessWidget {
  final String id;
  final String name;
  final _todoController = Get.find<TodoController>();
  TodoItem(this.id, this.name, {Key? key}) : super(key: key);

  onRemoveTodo() {
    _todoController.removeTodo(id);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        openThreshold: 0.3,
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            onPressed: (context) {
              Slidable.of(context)?.close();
              onRemoveTodo();
            },
          ),
        ],
      ),
      child: ListTile(
        title: Text(name),
      ),
    );
  }
}
