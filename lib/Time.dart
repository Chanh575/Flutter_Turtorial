import 'package:flutter/material.dart';

class ExampleTime extends StatelessWidget {
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
      home: MyTimePicker(),
    );
  }
}

class MyTimePicker extends StatefulWidget {
  @override
  _MyTimePickerState createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (selected != null && selected != _selectedTime) {
      setState(() {
        _selectedTime = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //
          title: Text("Hello"),
        ),
        body: InkWell(
          onTap: () {
            _selectTime(context);
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
                  'Chọn giờ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '${_selectedTime.hour}:${_selectedTime.minute}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ));
  }
}
