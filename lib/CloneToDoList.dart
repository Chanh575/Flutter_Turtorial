import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ToDoListAppClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      home: HomeToDoListApp(),
    );
  }
}

class HomeToDoListApp extends StatefulWidget {
  final int? state;

  HomeToDoListApp({Key? key, this.state}) : super(key: key);

  @override
  HomeToDoListAppState createState() => HomeToDoListAppState();
}

class HomeToDoListAppState extends State<HomeToDoListApp> {
  List<dynamic> result_works = [];
  List<dynamic> works = [];
  List<dynamic> states = [];
  String? searchKeyword;
  String appBarTitle = 'Danh sách công việc';

  @override
  void initState() {
    super.initState();
    if (widget.state != null) {
      filterWorksByState(widget.state);
    } else {
      getStatesAndWorks();
    }
  }

  Future<void> getStatesAndWorks() async {
    await getWorks();
    await getStates();
  }

  Future<void> getStates() async {
    try {
      var url =
          Uri.parse('https://64a3a353c3b509573b565853.mockapi.io/api/v1/state');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var utf8Body = utf8.decode(response.bodyBytes);
        var jsonData = jsonDecode(utf8Body);
        setState(() {
          states = getValuesForKey(jsonData, 'code', 'name');
        });
      } else {
        print('Lỗi: ${response.statusCode}');
      }
    } catch (error) {
      print('Lỗi kết nối: $error');
    }
  }

  Future<void> getWorks() async {
    try {
      var url =
          Uri.parse('https://64a3a353c3b509573b565853.mockapi.io/api/v1/works');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var utf8Body = utf8.decode(response.bodyBytes);
        var jsonData = jsonDecode(utf8Body);
        setState(() {
          result_works = jsonData;
          works = result_works;
        });
      } else {
        print('Lỗi: ${response.statusCode}');
      }
    } catch (error) {
      print('Lỗi kết nối: $error');
    }
  }

  List<dynamic> searchKeyFunction(List<dynamic> list, String? searchKeyword) {
    List<dynamic> result = [];
    searchKeyword = searchKeyword ?? '';
    if (searchKeyword != '') {
      result = list
          .where((work) => work['name']
              .toString()
              .toLowerCase()
              .contains(searchKeyword!.toLowerCase()))
          .toList();
    } else {
      result = list;
    }
    return result;
  }

  List<dynamic> filterFunction(List<dynamic> list, int? state) {
    List<dynamic> result = [];
    state = state ?? 0;
    if (state != 0) {
      result = list.where((work) => work['state'] as int == state).toList();
    } else {
      result = list;
    }
    return result;
  }

  List<String> listDymanicToListString(listDynamic) {
    List<String> listString = [];

    for (var element in listDynamic) {
      String elementString = element.toString();
      listString.add(elementString);
    }
    return listString;
  }

  List<dynamic> getValuesForKey(List<dynamic> list, String key1, String key2) {
    Set<dynamic> uniqueValues = {};
    list.forEach((map) => uniqueValues.add({key1: map[key1], key2: map[key2]}));
    return uniqueValues.toList();
  }

  void showSearchDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String keyword = '';
        return AlertDialog(
          title: Text('Tìm kiếm'),
          content: TextField(
            onChanged: (value) {
              keyword = value;
            },
          ),
          actions: [
            TextButton(
              child: Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Tìm kiếm'),
              onPressed: () {
                setState(() {
                  works = searchKeyFunction(result_works, keyword);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> filterWorksByState(int? state) async {
    setState(() {
      works = filterFunction(result_works, state);
    });
  }

  void deleteWork(int index) {
    setState(() {
      works.removeAt(index);
    });
  }

  void addWork(String work) {
    setState(() {
      works.add(work);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearchDialog();
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 65,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: SizedBox(
                  height: 100,
                  child: Text(
                    'Trạng thái công việc',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Tất cả công việc',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
                filterWorksByState(null);
                setState(() {
                  appBarTitle = 'Tất cả công việc';
                });
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: states.length,
              itemBuilder: (context, index) {
                var state = states[index];
                return ListTile(
                  title: Text(
                    state['name'],
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    filterWorksByState(state['code'] as int);
                    setState(() {
                      appBarTitle = state['name'];
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: works.length,
        itemBuilder: (context, index) {
          var work = works[index];
          return ListTile(
            title: Text(work['name']),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                deleteWork(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String work = '';
              return AlertDialog(
                title: Text('Thêm công việc mới'),
                content: TextField(
                  onChanged: (value) {
                    work = value;
                  },
                ),
                actions: [
                  TextButton(
                    child: Text('Hủy'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Thêm'),
                    onPressed: () {
                      addWork(work);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
