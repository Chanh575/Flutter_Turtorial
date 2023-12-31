import 'package:flutter/material.dart';

// hinh 1
class AppTest extends StatelessWidget {
  const AppTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Demo'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
              padding: const EdgeInsets.all(50),
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
  const AppTest2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Demo'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
              padding: const EdgeInsets.all(50),
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
                      SizedBox(
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
  const AppTest3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Demo'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
              padding: const EdgeInsets.all(50),
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
                      SizedBox(
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
  const AppTest4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Demo'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
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
  const AppTest5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Demo'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Center(
            child: SizedBox(
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
                      decoration: const BoxDecoration(
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
                      decoration: const BoxDecoration(
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
                      decoration: const BoxDecoration(
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
  const AppTest6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Demo'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Container(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
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
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 60.0),
                        height: 90,
                        width: 90,
                        decoration: const BoxDecoration(
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
  const AppTest7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Demo'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30.0),
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
                          color: const Color.fromARGB(255, 4, 34, 85),
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
                          color: const Color.fromARGB(255, 4, 34, 85),
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
                          color: const Color.fromARGB(255, 4, 34, 85),
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
class AppTest8 extends StatelessWidget {
  const AppTest8({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double desiredHeight = screenHeight * 0.6;
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Demo'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Stack(
              children: [
                Align(
                    alignment: const Alignment(0.45, -0.95),
                    child: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1, color: Colors.green),
                        ))),
                Align(
                  alignment: const Alignment(0, -0.4),
                  child: Container(
                    height: 130,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.green),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                height: 50,
                                width: 50,
                                color: Colors.red,
                              ),
                              Transform.translate(
                                offset: const Offset(0, 50 * (-0.7)),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 50,
                                  width: 50,
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 50,
                                width: 50,
                                color: Colors.yellow,
                              )
                            ],
                          )
                        ]),
                  ),
                )
              ],
            )));
  }
}

// hinh 9 (Con hinh tam giac)
class AppTest9 extends StatelessWidget {
  const AppTest9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          color: const Color.fromARGB(255, 11, 35, 77),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: ClipPath(
                              clipper: TriangleClipper(),
                              child: Container(
                                width: 81,
                                height: 81,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height); // Điểm góc dưới bên trái
    path.lineTo(size.width, size.height); // Điểm góc dưới bên phải
    path.lineTo(size.width, 0); // Điểm góc trên bên phải
    path.close(); // Kết thúc hình tam giác

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Bai tap dieu huong

class AppTest10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bài tập xây dựng giao diện'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Widget> interfaces = [
    AppTest(),
    AppTest2(),
    AppTest3(),
    AppTest4(),
    AppTest5(),
    AppTest6(),
    AppTest7(),
    AppTest8(),
    AppTest9()
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 16.0,
        runSpacing: 16.0,
        // Tao ra mot list cac button dua vao do dai va index
        children: List.generate(interfaces.length, (index) {
          // Tao ra su kien khi click vao widget
          return GestureDetector(
            onTap: () {
              // chuyen trang nhung tai sao ko co nut back lai?
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => interfaces[index],
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: 100.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Bài tập ${index + 1}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
