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
          width: 200,
          height: 200,
          styles:
              "border-8 laptop:border-4 mobile:bg-green-500 tab:bg-yellow-400 laptop:bg-red-500 desktop:bg-pink-500",
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
