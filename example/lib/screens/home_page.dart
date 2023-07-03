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
        child: RapidContainer(
          styles: "bg-yellow-600",
          child: Center(
            child: Text(
              "This is a rapid container",
            ),
          ),
        ),
      ),
    );
  }
}
