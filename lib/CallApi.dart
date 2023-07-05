import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class CallAPI extends StatefulWidget {
  @override
  _CallAPIState createState() => _CallAPIState();
}

class _CallAPIState extends State<CallAPI> {
  bool isDarkModeEnabled = false;

  void toggleDarkMode() {
    setState(() {
      isDarkModeEnabled = !isDarkModeEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call API',
      theme: isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: ArticleListWidget(toggleDarkMode: toggleDarkMode),
    );
  }
}

class ArticleListWidget extends StatefulWidget {
  final VoidCallback? toggleDarkMode;
  String? cate; // Biến để nhận giá trị từ bên ngoài
  String? searchKeyword;
  ArticleListWidget(
      {super.key,
      this.cate,
      this.searchKeyword,
      this.toggleDarkMode}); // Constructor để nhận giá trị
  @override
  _ArticleListWidgetState createState() => _ArticleListWidgetState();
}

class _ArticleListWidgetState extends State<ArticleListWidget> {
  List<dynamic> articles_origin = [];
  List<dynamic> articles = [];
  List<dynamic> categories = [];
  String appBarTitle = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var url = Uri.parse(
          'https://gw.vnexpress.net/ar/get_rule_2?category_id=1003834&limit=10&page=1&data_select=title,lead,privacy,thumbnail_url,share_url,article_type,original_cate,article_category,publish_time,off_thumb&thumb_size=300x180&thumb_quality=100&thumb_dpr=1,2&thumb_fit=crop');

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        setState(() {
          articles = jsonData['data']['1003834']['data'] as List<dynamic>;
          articles_origin = [...articles];
          if (widget.cate != null) {
            articles = articles
                .where((article) =>
                    article['article_category']['cate_name'] == widget.cate)
                .toList();
            appBarTitle = widget.cate!;
          } else {
            appBarTitle = 'Tất cả bài viết';
          }
          categories =
              getValuesForKey(articles_origin, 'article_category', 'cate_name');

          if (widget.searchKeyword != null) {
            articles = articles
                .where((article) =>
                    article['title'].toString().toLowerCase().contains(
                          widget.searchKeyword!.toLowerCase(),
                        ))
                .toList();
            appBarTitle = 'Từ khóa: ${widget.searchKeyword}';
          }
          // Cập nhật tiêu đề của AppBar
        });
      } else {
        print('Lỗi: ${response.statusCode}');
      }
    } catch (error) {
      print('Lỗi kết nối: $error');
    }
  }

  List<dynamic> getValuesForKey(List<dynamic> list, String key1, String key2) {
    Set<dynamic> uniqueValues = {};
    list.forEach((map) => uniqueValues.add(map[key1][key2]));
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
                  widget.searchKeyword = keyword;
                });
                Navigator.of(context).pop();
                fetchData();
              },
            ),
          ],
        );
      },
    );
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
            onPressed: widget.toggleDarkMode,
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
                    'Danh mục bài viết',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                // Change color when hover can not working
                bool isHovered = false;
                return MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      isHovered = true;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      isHovered = false;
                    });
                  },
                  child: ListTile(
                    title: Text(
                      categories[index],
                      style: TextStyle(),
                    ),
                    onTap: () {
                      // Xử lý sự kiện khi một ListTile được nhấn
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ArticleListWidget(cate: categories[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  widget.cate = null;
                  widget.searchKeyword = null;
                  fetchData();
                });
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.search),
            //   onPressed: () {
            //     // Thực hiện hành động tìm kiếm
            //   },
            // ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: widget.toggleDarkMode,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          var article = articles[index];
          return Card(
            child: ListTile(
              title: Text(
                article['title'],
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto'),
              ),
              subtitle: Text(
                article['lead'],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ), // Điều chỉnh tỷ lệ văn bản),
                textAlign: TextAlign.justify,
              ),
              leading: AspectRatio(
                aspectRatio: 16 / 9,
                // Tỷ lệ khung hình 16:9

                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black26),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.network(
                    article['thumbnail_url'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailScreen(article: article),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ArticleDetailScreen extends StatelessWidget {
  Map<dynamic, dynamic> article;

  ArticleDetailScreen({super.key, required this.article});
  Future<void> _launchURL() async {
    String url = article['share_url'];
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Không thể mở URL: $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(article['title']),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      article['lead'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [Text(article['title'])],
              ),
              Row(
                children: [
                  Expanded(
                    child: Image.network(
                      article['thumbnail_url'],
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => _launchURL(),
                    child: Text(
                      'Xem video chi tiết',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
