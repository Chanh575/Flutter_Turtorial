import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ToDoListApp extends StatelessWidget {
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
  // final int? state;
  int? state;
  // HomeToDoListApp({Key? key, this.state}) : super(key: key);
  HomeToDoListApp({super.key, this.state});

  @override
  HomeToDoListAppState createState() => HomeToDoListAppState();
}

class HomeToDoListAppState extends State<HomeToDoListApp> {
  // List works get API
  List<dynamic> result_works = [];
  // List works current(search/filter)
  List<dynamic> works = [];
  // list states
  List<dynamic> states = [];
  // Search key
  String? searchKeyword;
  // Title
  String appBartitle = 'Danh sách công việc';

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
  // @override
  // void initState() {
  //   super.initState();
  //   getStates();
  //   getWorks();
  // }

  // Search key function
  List<dynamic> searchKeyFunction(List<dynamic> list, String? searchKeyword) {
    List<dynamic> result = [];
    searchKeyword = searchKeyword ?? '';
    if (searchKeyword != '') {
      result = list
          .where((work) => work['name'].toString().toLowerCase().contains(
                searchKeyword!.toLowerCase(),
              ))
          .toList();
    } else {
      result = list;
    }
    return result;
  }

  // Filter by state
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

  // Convert List<dymanic> to List<String>
  List<String> listDymanicToListString(listDynamic) {
    List<String> listString = [];

    // Duyệt qua từng phần tử trong danh sách dynamic và chuyển đổi thành kiểu String
    for (var element in listDynamic) {
      String elementString = element.toString(); // Chuyển đổi thành kiểu String
      listString.add(elementString); // Thêm vào danh sách mới có kiểu String
    }
    return listString;
  }

  // Get values from key
  List<dynamic> getValuesForKey(
    List<dynamic> list,
    String key1,
    String key2,
  ) {
    Set<dynamic> uniqueValues = {};
    list.forEach((map) => uniqueValues.add({key1: map[key1], key2: map[key2]}));
    return uniqueValues.toList();
  }

  // Add function update works when change state
  Future<void> filterWorksByState(int? state) async {
    setState(() {
      works = filterFunction(result_works, state);
    });
  }

  // Show dialog search
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

  // Show delete dialog
  void showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String keyword = '';
        return AlertDialog(
          title: Text('Bạn có muốn xóa công việc này?'),
          actions: [
            TextButton(
              child: Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Xóa'),
              onPressed: () {
                setState(() {
                  deleteWork(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Call API get states
  Future<void> getStates() async {
    try {
      var url_get_state =
          Uri.parse('https://64a3a353c3b509573b565853.mockapi.io/api/v1/state');

      var response = await http.get(url_get_state);

      if (response.statusCode == 200) {
        var utf8Body = utf8
            .decode(response.bodyBytes); // Mã hóa UTF-8 cho phần thân phản hồi
        var jsonData = jsonDecode(utf8Body);
        setState(() {
          states = getValuesForKey(jsonData, 'code', 'name');
        });
        // Cập nhật tiêu đề của AppBar
      } else {
        print('Lỗi: ${response.statusCode}');
      }
    } catch (error) {
      print('Lỗi kết nối: $error');
    }
  }

  // Call API get works
  Future<void> getWorks() async {
    try {
      var url_get_works =
          Uri.parse('https://64a3a353c3b509573b565853.mockapi.io/api/v1/works');

      var response = await http.get(url_get_works);

      if (response.statusCode == 200) {
        var utf8Body = utf8
            .decode(response.bodyBytes); // Mã hóa UTF-8 cho phần thân phản hồi
        var jsonData = jsonDecode(utf8Body);
        // When click state
        if (widget.state != null) {
          jsonData = filterFunction(jsonData, widget.state);
        }
        setState(() {
          result_works = jsonData;
          works = result_works;
        });
        // Cập nhật tiêu đề của AppBar
      } else {
        print('Lỗi: ${response.statusCode}');
      }
    } catch (error) {
      print('Lỗi kết nối: $error');
    }
  }

  void deleteWork(int index) {
    setState(() {
      works.removeAt(index);
    });
  }

  void addWork(String work) {
    setState(() {
      works.add({'name': work});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //
        title: Text(appBartitle),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearchDialog();
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => {},
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
                  height: 100, // Kích thước tối đa của Text
                  child: Text(
                    'Trạng thái công việc',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Tất cả công việc',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                filterWorksByState(null);
                setState(() {
                  appBartitle = 'Tất cả công việc';
                });

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeToDoListApp()),
                // );
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
                      appBartitle = state['name'];
                    });

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         HomeToDoListApp(state: state['code'] as int),
                    //   ),
                    // );
                  },
                );
              },
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: works.length,
        itemBuilder: (context, index) {
          var work = works[index];
          return ListTile(
            title: Text(
              work['name'],
              style: TextStyle(fontSize: 17, fontFamily: 'Roboto'),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDeleteDialog(index);
              },
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailWork(work: work),
                ),
              )
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Khi nhan vao button thi chuyen trang va truyen function addbook
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeAddWork(
                addWork: addWork,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// Add Work --> using StatefulWidget
class HomeAddWork extends StatefulWidget {
  final Function(String) addWork;
  const HomeAddWork({super.key, required this.addWork});

  @override
  HomeAddWorkState createState() => HomeAddWorkState();
}

class HomeAddWorkState extends State<HomeAddWork> {
  // Time
  late TimeOfDay _selectedTimeStart;
  late TimeOfDay _selectedTimeEnd;
  final TextEditingController _textEditingBookController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    _selectedTimeStart = TimeOfDay.now();
    _selectedTimeEnd = TimeOfDay.now();
  }

  Future<void> _selectTimeStart(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: _selectedTimeStart,
    );
    if (selected != null && selected != _selectedTimeStart) {
      setState(() {
        _selectedTimeStart = selected;
      });
    }
  }

  Future<void> _selectTimeEnd(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: _selectedTimeEnd,
    );
    if (selected != null && selected != _selectedTimeEnd) {
      setState(() {
        _selectedTimeEnd = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm công việc'),
      ),
      body: Column(children: [
        SizedBox(height: 7),
        TextField(
          // Truyen gia tri vao _textEditingBookController moi khi nhap
          controller: _textEditingBookController,
          decoration: InputDecoration(
            labelText: 'Tên công việc',
          ),
        ),
        TextField(
          // Truyen gia tri vao _textEditingBookController moi khi nhap
          controller: _textEditingBookController,
          decoration: InputDecoration(
            labelText: 'Mô tả công việc',
          ),
        ),
        TextField(
          // Truyen gia tri vao _textEditingBookController moi khi nhap
          controller: _textEditingBookController,
          decoration: InputDecoration(
            labelText: 'Thời gian ước lượng (giờ)',
          ),
        ),
        InkWell(
          onTap: () {
            _selectTimeStart(context);
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chọn giờ bắt đầu (dự kiến)',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '${_selectedTimeStart.hour}:${_selectedTimeStart.minute}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _selectTimeStart(context);
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chọn giờ kết thúc (dự kiến)',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '${_selectedTimeStart.hour}:${_selectedTimeStart.minute}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        TextField(
          // Truyen gia tri vao _textEditingBookController moi khi nhap
          controller: _textEditingBookController,
          decoration: InputDecoration(
            labelText: 'Độ ưu tiên',
          ),
        ),
        SizedBox(height: 13.0),
        ElevatedButton(
            onPressed: () {
              String workName = _textEditingBookController.text.trim();
              if (workName.isNotEmpty) {
                // Doi tuong widget tham chieu den ScreenAddWork cua State hien tai
                widget.addWork(workName);
                Navigator.pop(context);
              }
            },
            child: Text('Thêm công việc'))
      ]),
    );
  }
}

// Deital Work --> using StatefulWidget
class HomeDetailWork extends StatefulWidget {
  // final Function(String) addWork;
  Map<dynamic, dynamic> work;
  HomeDetailWork({super.key, required this.work});

  @override
  HomeDetailWorkState createState() => HomeDetailWorkState();
}

class HomeDetailWorkState extends State<HomeDetailWork> {
  void deleteWork(int index) {
    setState(() {
      widget.work['detail'].removeAt(index);
    });
  }

  final TextEditingController _textEditingBookController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết công việc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.work['name'],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${widget.work['priority']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Mô tả công việc:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.work['description'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Thời gian dự kiến: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '${widget.work['time_estimed']} giờ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Thời gian thực hiện: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Từ ${widget.work['time_start']} đến ${widget.work['time_end']}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Công việc chi tiết:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20.0,
                horizontalMargin: 0,
                columns: [
                  DataColumn(
                    label: Text(
                      'Tên công việc',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Dự kiến',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Độ ưu tiên',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '',
                    ),
                  ),
                ],
                rows: List<DataRow>.generate(
                  widget.work['detail'].length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Text(
                          widget.work['detail'][index]['name'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DataCell(
                        Text(
                          '${widget.work['detail'][index]['time_estimed']} giờ',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DataCell(
                        Text(
                          '${widget.work['detail'][index]['priority']}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DataCell(Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deleteWork(index);
                            },
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ************ Time ************** //
