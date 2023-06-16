import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

// hinh 1
class AppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Demo'),
          ),
          body: Container(
              padding: EdgeInsets.all(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}

// hinh 2
class AppTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Demo'),
          ),
          body: Container(
              padding: EdgeInsets.all(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.blueGrey,
                      ),
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.red,
                      ),
                      Container(
                          width: 80,
                          height: 55,
                          child: ClipOval(
                              child: Container(
                            color: Colors.green,
                          ))),
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}

// hinh 3
class AppTest3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Demo'),
          ),
          body: Container(
              padding: EdgeInsets.all(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 80,
                          height: 55,
                          child: ClipOval(
                              child: Container(
                            color: Colors.green,
                          ))),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 80,
                        height: 55,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}

// hinh 4
class AppTest4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Demo'),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
              child: Column(
                children: [
                  Expanded(
                    flex: 60,
                    child: Container(color: Colors.green),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    flex: 40,
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.blueGrey,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.blueGrey,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            )));
  }
}

// hinh 5
class AppTest5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Demo'),
          ),
          body: Center(
            child: Container(
              height: 300,
              width: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: 60,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

// hinh 6
class AppTest6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Demo'),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 75,
                        child: Container(
                            color: Colors.grey,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 45,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 2, 46, 122),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(50.0),
                                        bottomRight: Radius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 55,
                                  child: Container(),
                                ),
                              ],
                            )),
                      ),
                      Expanded(
                        flex: 25,
                        child: Container(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 60.0),
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 100,
                        width: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.blueGrey,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.blueGrey,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}

// hinh 7
class AppTest7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Demo'),
            ),
            body: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    width: 280,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.green),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Color.fromARGB(255, 4, 34, 85),
                        ),
                        Container(
                          height: 100,
                          width: 150,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 280,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.green),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Color.fromARGB(255, 4, 34, 85),
                        ),
                        Container(
                          height: 100,
                          width: 150,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 280,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.green),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Color.fromARGB(255, 4, 34, 85),
                        ),
                        Container(
                          height: 100,
                          width: 150,
                          color: Colors.red,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ]))));
  }
}

// hinh 8
// hinh 9
