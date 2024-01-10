import 'package:flutter/material.dart';
import 'package:practice_project/homePage/jihc_section.dart';
import 'package:practice_project/homePage/news_section.dart';
import 'package:practice_project/homePage/teacher_section.dart';
import 'package:practice_project/notificationPage/notification_page.dart';
import 'package:practice_project/routes/app_roures.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Басты",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.home,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 0),
                SizedBox(
                  width: 40,
                  height: 40,
                  // margin: EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.registeration);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://static.vecteezy.com/system/resources/previews/021/079/672/original/user-account-icon-for-your-design-only-free-png.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 20),
              child: Column(
                children: <Widget>[
                  NewsSection(),
                  SizedBox(height: 30),
                  JIHCSection(),
                  SizedBox(height: 30),
                  TeacherSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
