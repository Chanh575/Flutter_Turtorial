// Test StatelessWidget
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String name;
  int age;

  MyApp({super.key, required this.name, this.age = 0});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App test'),
        ),
        body: Center(
            child: Text(
          "Hello $name, $age tuổi",
          style: const TextStyle(fontSize: 30),
          textDirection: TextDirection.ltr,
        )),
      ),
    );
  }
}
