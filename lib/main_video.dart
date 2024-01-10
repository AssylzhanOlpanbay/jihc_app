import 'package:flutter/material.dart';
import 'package:practice_project/screens_video/home_screen.dart';

class MyVideoPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter YouTube API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}
