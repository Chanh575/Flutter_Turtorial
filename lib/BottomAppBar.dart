import 'package:flutter/material.dart';

class ButtomAppBar extends StatelessWidget {
  const ButtomAppBar({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title of Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
        elevation: 2.0,
        child: const Icon(Icons.add),
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
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
