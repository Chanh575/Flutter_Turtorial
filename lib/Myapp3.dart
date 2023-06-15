// ScaffoldState.showButtonSheet() -->
import 'package:flutter/material.dart';

class Myapp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App demo'),
      ),
      body: Center(
        child: Center(child: Builder(builder: (BuildContext ctxOfScaffold) {
          return ElevatedButton(
              onPressed: () {
                this._showMyButtomSheet(ctxOfScaffold);
              },
              child: const Icon(Icons.add));
        })),
      ),
      floatingActionButton: Builder(builder: (BuildContext ctxOfScaffold) {
        return FloatingActionButton(
          onPressed: () => this._showModalBottomSheet(ctxOfScaffold),
          child: const Icon(Icons.show_chart_sharp),
        );
      }),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen[200],
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.home),
              label: const Text(""),
              onPressed: () {},
            ),
            TextButton.icon(
              icon: const Icon(Icons.email),
              label: const Text(""),
              onPressed: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.greenAccent,
    );
  }

  void _showMyButtomSheet(BuildContext ctxOfScaffold) {
    Scaffold.of(ctxOfScaffold).showBottomSheet((context) => Container(
          height: 200,
          color: Colors.pink,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Bottom sheet'),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'))
              ],
            ),
          ),
        ));
  }

  void _showModalBottomSheet(BuildContext context) {
    // Call showModalBottomSheet(), this function open a Dialog
    // and return Future object.
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: const Center(
              child: Text("Welcome to Model!"),
            ),
          );
        });
  }
}
