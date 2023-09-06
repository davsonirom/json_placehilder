import 'package:flutter/material.dart';

void main() {
  runApp(const MiaSoftware39());
}

class MiaSoftware39 extends StatelessWidget {
  const MiaSoftware39({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '{JSON}Placeholder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const SizedBox.shrink(),
    );
  }
}
