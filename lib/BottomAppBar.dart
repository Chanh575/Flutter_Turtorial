import 'package:flutter/material.dart';

class ButtomAppBar extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title of Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomAppBar Example"),
      ),
      body: const Center(
          child: Text(
        'Flutter BottomAppBar Example',
      )),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: <Widget>[
      //       IconButton(
      //         icon: const Icon(Icons.home),
      //         onPressed: () {},
      //       ),
      //       PopupMenuButton(
      //         icon: const Icon(Icons.share),
      //         itemBuilder: (context) => [
      //           const PopupMenuItem(
      //             value: 1,
      //             child: Text("Facebook"),
      //           ),
      //           const PopupMenuItem(
      //             value: 2,
      //             child: Text("Instagram"),
      //           ),
      //         ],
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.email),
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      // floatingActionButton: FloatingActionButton.extended (
      //   elevation: 4.0,
      //   icon: const Icon(Icons.add),
      //   label: const Text('Add a task'),
      //   onPressed: () {},
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.greenAccent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
