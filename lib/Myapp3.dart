// ScaffoldState.showButtonSheet() -->
import 'package:flutter/material.dart';

class Myapp3 extends StatelessWidget {
  const Myapp3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App demo'),
      ),
      body: Center(
        child: Center(child: Builder(builder: (BuildContext ctxOfScaffold) {
          return ElevatedButton(
              onPressed: () {
                _showMyButtomSheet(ctxOfScaffold);
              },
              child: const Icon(Icons.add));
        })),
      ),
      floatingActionButton: Builder(builder: (BuildContext ctxOfScaffold) {
        return FloatingActionButton(
          onPressed: () => _showModalBottomSheet(ctxOfScaffold),
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
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: const Center(
              child: Text("Welcome to Model!"),
            ),
          );
        });
  }
}

//  SingleChildScrollView

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              LogoBox(),
              LogoBox(),
              LogoBox(),
              LogoBox(),
              LogoBox(),
              LogoBox(),
            ],
          ),
        ),
      ),
    ));
  }
}

class LogoBox extends StatelessWidget {
  const LogoBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(width: 1, color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(50),
      child: FlutterLogo(
        size: 50,
      ),
    );
  }
}
