import 'package:flutter/material.dart';

class AppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid of Small Rectangles',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grid of Small Rectangles'),
        ),
        body: GridView.count(
          crossAxisCount: 3, // Số cột trong lưới
          children: List.generate(9, (index) {
            return Container(
              color: Colors.blue,
              margin: EdgeInsets.all(8),
            );
          }),
        ),
      ),
    );
  }
}
