import 'package:example/screens/card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rapid example"),
        elevation: 0.0,
        backgroundColor: Colors.grey.shade800,
      ),
      body: const DemoCard(),
    );
  }
}
