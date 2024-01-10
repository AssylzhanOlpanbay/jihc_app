import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UniversityApp extends StatelessWidget {
  const UniversityApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter & HTTP',
      home: UniversityPage(),
    );
  }
}

class UniversityPage extends StatefulWidget {
  const UniversityPage({Key? key}) : super(key: key);

  @override
  State<UniversityPage> createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter & HTTP'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}

Future<http.Response> getData() async {
  const url =
      'http://universities.hipolabs.com/search?name=middle&country=turkey';
  return await http.get(Uri.parse(url));
}

void loadData() {
  getData().then((response) {
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }).catchError((error) {
    debugPrint(error.toString());
  });
}
