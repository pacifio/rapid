import 'package:example/screens/todo.dart';
import 'package:flutter/material.dart';
import 'package:rapid/rapid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rapid example"),
      ),
      body: const Center(
        child: RapidFlow(
          styles: "column laptop:row desktop:row",
          children: [
            Todo(title: "This is a todo"),
            Todo(title: "This is a todo"),
          ],
        ),
      ),
    );
  }
}
