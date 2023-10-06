// kindacode.com
// main.dart
import 'package:flutter/material.dart';
import 'package:user_log_study/solution1.dart';
import 'package:user_log_study/solution2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'touch detect',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Solution1(),
    );
  }
}
