import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
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
        title: const Text("App Test"),
      ),
      body: Container(
          width: 200,
          height: 350,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black26),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            // Khong vao giua???
            alignment: Alignment.center,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'Green widget',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 40,
                  right: 40,
                  child: Container(
                    height: 120,
                    color: Colors.red,
                    child: const Center(
                        child: Text(
                      'Red widget',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
