import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String name;
  int age;

  MyApp({required this.name, this.age = 0});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
            child: Text(
          "Hello $name, $age tuổi",
          style: TextStyle(fontSize: 30),
          textDirection: TextDirection.ltr,
        )),
      ),
    );
  }
}
