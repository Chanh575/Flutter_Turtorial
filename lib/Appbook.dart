import 'package:flutter/material.dart';

class BookManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý sách',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: BookListScreen(),
    );
  }
}

class BookListScreen extends StatefulWidget {
  @override
  BookListScreenState createState() => BookListScreenState();
}

class BookListScreenState extends State<BookListScreen> {
  List<String> books = ['Book 1', 'Book 2', 'Book 3'];
  void deleteBook(int index) {
    setState(() {
      books.removeAt(index);
    });
  }

  void addBook(String book) {
    setState(() {
      books.add(book);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý sách'),
      ),
      body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(books[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deleteBook(index);
                  },
                ));
          }),
      floatingActionButton: FloatingActionButton(
        // Khi nhan vao button thi chuyen trang va truyen function addbook
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenAddBook(
                addBook: addBook,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// using StatefulWidget
class ScreenAddBook extends StatefulWidget {
  final Function(String) addBook;
  const ScreenAddBook({super.key, required this.addBook});

  @override
  ScreenAddBookState createState() => ScreenAddBookState();
}

class ScreenAddBookState extends State<ScreenAddBook> {
  final TextEditingController _textEditingBookController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giao diện thêm sách'),
      ),
      body: Column(children: [
        SizedBox(height: 7),
        TextField(
          // Truyen gia tri vao _textEditingBookController moi khi nhap
          controller: _textEditingBookController,
          decoration: InputDecoration(
            labelText: 'Tên sách',
          ),
        ),
        SizedBox(height: 13.0),
        ElevatedButton(
            onPressed: () {
              String bookName = _textEditingBookController.text.trim();
              if (bookName.isNotEmpty) {
                // Doi tuong widget tham chieu den ScreenAddBook cua State hien tai
                widget.addBook(bookName);
                Navigator.pop(context);
              }
            },
            child: Text('Thêm sách'))
      ]),
    );
  }
}

// using StatelessWidget
// class ScreenAddBook extends StatelessWidget {
//   final Function(String) addBook;

//   ScreenAddBook({required this.addBook});

//   final TextEditingController _textEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Book'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _textEditingController,
//               decoration: InputDecoration(
//                 labelText: 'Book Name',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 String bookName = _textEditingController.text.trim();
//                 if (bookName.isNotEmpty) {
//                   addBook(bookName);
//                   Navigator.pop(context);
//                 }
//               },
//               child: Text('Add Book'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
