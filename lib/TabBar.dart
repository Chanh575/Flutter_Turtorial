import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key});

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int carClick = 0;
  int transitClick = 0;
  int bikeClick = 0;
  @override
  Widget build(BuildContext context) {
    EdgeInsets a2;
    EdgeInsetsDirectional a;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: createTabBar(),
            title: const Text('Flutter TabBar Example'),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text("Car")),
              Center(child: Text("Transit")),
              Center(child: Text("Bike"))
            ],
          ),
        ));
  }

  PreferredSize createTabBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          isScrollable: true,
          tabs: const [
            Row(children: [
              Icon(Icons.directions_car),
              SizedBox(width: 5),
              Text("Car")
            ]),
            Row(children: [
              Icon(Icons.directions_transit),
              SizedBox(width: 5),
              Text("Transit")
            ]),
            Row(children: [
              Icon(Icons.directions_bike),
              SizedBox(width: 5),
              Text("Bike")
            ])
          ],
          onTap: (index) {
            onTapHandler(index);
          },
          indicatorColor: const Color(0xffE74C3C),
          // bottom border click
          indicatorWeight: 10,
          // background click
          indicatorPadding: const EdgeInsets.only(right: 20),

          labelColor: Colors.red,
          unselectedLabelColor: Colors.white,

          labelPadding: const EdgeInsets.all(20),

          // labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          // unselectedLabelStyle:
          //     TextStyle(fontStyle: FontStyle.normal, fontSize: 18),
        ),
      ),
    );
  }

  void onTapHandler(int index) {
    setState(() {
      switch (index) {
        case 0:
          carClick++;
          break;
        case 1:
          transitClick++;
          break;
        case 2:
          bikeClick++;
          break;
      }
    });
  }
}
