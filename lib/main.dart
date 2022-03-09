// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_flutter_demo/controllers/todo.controller.dart';
import 'package:todo_flutter_demo/entities/todo.entity.dart';
import 'package:todo_flutter_demo/features/add_todo/widgets/add_todo.widget.dart';
import 'package:todo_flutter_demo/features/list_todo/widgets/todo_list.widget.dart';

import 'features/count_todo/widgets/todo_count.widget.dart';
import 'infrastructures/hive.db.dart';

void main() async {
  await prepareApp();
  runApp(TodoApp());
}

Future<void> prepareApp() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoEntityAdapter());

  await HiveInfra.openBox();

  Get.lazyPut<TodoController>(() => TodoController());
}

class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return MaterialApp(
      home: TodoHome(),
    );
  }
}

class TodoHome extends StatelessWidget {
  TodoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Todo App",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AddTodoWidget(),
              Expanded(
                child: TodoListWidget(),
              ),
              CountTodoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
