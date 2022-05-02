// Import
import 'package:flutter/material.dart';
import 'package:bubble/screens/screens.dart';
import 'package:bubble/theme.dart';

// Application class
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bubble',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(),
      darkTheme: darkThemeData(),
      home: const HomeScreen(),
    );
  }
}

// Main function
void main() => runApp(const MyApp());
