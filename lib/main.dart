// Import
import 'package:flutter/material.dart';

// Main function
void main() {
  runApp(const MyApp());
}

// Application class
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bubble',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('bubble'),
        ),
        body: const Center(
          child: Text('bubble'),
        ),
      ),
    );
  }
}
