import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "This is a HomePage",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text("Hi"),
            ));
  }
  // Icon annountcement
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //         title: IconTitleWidget(),
  //         leading: IconButton(
  //             icon: Icon(Icons.notifications_active),
  //             onPressed: () {
  //               showAlert(context);
  //             })),
  //     body: const Center(child: Text('Test Appbar')),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //           title: IconTitleWidget(),
  //           leading: MyVolumnButton(),
  //           actions: <Widget>[
  //             IconButton(
  //               icon: Icon(Icons.file_upload),
  //               onPressed: () => {print("Click on upload button")},
  //             ),
  //             IconButton(
  //                 icon: Icon(Icons.settings),
  //                 onPressed: () => {print("Click on settings button")}),
  //             PopupMenuButton(
  //               icon: Icon(Icons.share),
  //               itemBuilder: (context) => [
  //                 const PopupMenuItem(
  //                   value: 1,
  //                   child: Text("Facebook"),
  //                 ),
  //                 const PopupMenuItem(
  //                   value: 2,
  //                   child: Text("Instagram"),
  //                 ),
  //               ],
  //             )
  //           ]),
  //       body: const Center(child: Text('Test Appbar')),
  //       drawer: Drawer(
  //           child: ListView(
  //         children: const <Widget>[
  //           DrawerHeader(
  //             decoration: BoxDecoration(
  //               color: Colors.green,
  //             ),
  //             child: Text(
  //               'My Drawer',
  //               style: TextStyle(
  //                 color: Colors.green,
  //                 fontSize: 24,
  //               ),
  //             ),
  //           ),
  //           ListTile(
  //             title: Text('Gallery'),
  //           ),
  //           ListTile(
  //             title: Text('Slideshow'),
  //           ),
  //         ],
  //       )));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Flutter AppBar Example'),
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
}

class MyVolumnButton extends StatefulWidget {
  const MyVolumnButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyVolumeButtonState();
  }
}

class MyVolumeButtonState extends State<MyVolumnButton> {
  bool volumeOn = true;
  //
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: volumeOn ? const Icon(Icons.volume_up) : const Icon(Icons.volume_mute),
      onPressed: () {
        // Set new State
        setState(() => volumeOn = !volumeOn);
      },
    );
  }
}

class IconTitleWidget extends StatelessWidget {
  const IconTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.train),
          Icon(Icons.place),
          SizedBox(
            width: 3,
          ),
          Text('Test')
        ]);
  }
}
