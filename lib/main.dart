import 'package:flutter/material.dart';

void main() async {
  await prepareApp();
  runApp(const TodoApp());
}

Future<void> prepareApp() async {}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: const Center(
        child: Text("This is demo"),
      ),
    );
  }
}
