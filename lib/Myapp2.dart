import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "This is a HomePage",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyHomePage> {
  int _count = 0;
  String _email = '';
  final emailEditingController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App test fultter'),
        ),
        drawer: Drawer(
          child: ListView(
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Center(
                    child: Text(
                  'navbar test',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                )),
              ),
              ListTile(
                title: Text('Gallery'),
              ),
              ListTile(
                title: Text('Slideshow'),
              ),
            ],
          ),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: emailEditingController,
              onChanged: (text) {
                setState(() {
                  _email = text;
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: 'Nhập email của bạn'),
            ),
          ),
          Text("Email đã nhập:",
              style: TextStyle(fontSize: 30, color: Colors.black)),
          Text(_email, style: TextStyle(fontSize: 30, color: Colors.blue)),
          Text("Bạn đã nhấn $_count lần!",
              style: TextStyle(fontSize: 20, color: Colors.red)),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() => this._count++);
          },
          tooltip: 'Tăng số đếm',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: BottomAppBar(
        //   // shape: CircularNotchedRectangle(),
        //   color: Colors.black12,
        //   child: Container(
        //     height: 50.0,
        //   ),
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //     currentIndex: 0,
        //     fixedColor: Colors.green,
        //     items: const [
        //       BottomNavigationBarItem(
        //         label: 'Home',
        //         icon: Icon(Icons.home),
        //       ),
        //       BottomNavigationBarItem(
        //         label: 'Search',
        //         icon: Icon(Icons.search),
        //       ),
        //       BottomNavigationBarItem(
        //         label: 'profile',
        //         icon: Icon(Icons.account_circle),
        //       ),
        //     ],
        //     onTap: (int indexOfItem) {}),
        bottomSheet: Container(
            height: 55,
            color: Colors.cyan[50],
            child: const Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.place),
                    SizedBox(width: 5, height: 5),
                    Text("199 Valencia St, San Francisco, CA")
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 5, height: 5),
                    Text("(415) 339-0942)")
                  ],
                )
              ],
            )),
        persistentFooterButtons: [
          TextButton.icon(
              icon: Icon(Icons.map), label: Text(""), onPressed: () {}),
          TextButton.icon(
              icon: Icon(Icons.view_week), label: Text(""), onPressed: () {}),
        ],
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightGreen[200],
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.home),
                label: Text(""),
                onPressed: () {},
              ),
              TextButton.icon(
                icon: Icon(Icons.email),
                label: Text(""),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
