import 'package:flutter/material.dart';

class MyApp2 extends StatefulWidget {
  String name;
  int age;

  MyApp2({required this.name, this.age = 0});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This is a Statfullwidget",
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Name = ${widget.name}, age = ${widget.age}',
                style: TextStyle(fontSize: 30, color: Colors.red)),
            Text('Name = ${widget.name}, age = ${widget.age}',
                style: TextStyle(fontSize: 30, color: Colors.black)),
            Text('Name = ${widget.name}, age = ${widget.age}',
                style: TextStyle(fontSize: 30, color: Colors.blue)),
          ]),
        ),
      ),
    );
  }
}
