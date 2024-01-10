import 'package:flutter/material.dart';
import 'package:practice_project/buhgalterPage/employes_section.dart';
import 'package:practice_project/buhgalterPage/pay_section.dart';

class MyBuhgalter extends StatefulWidget {
  static const buhgalter = '/buhgalter';

  const MyBuhgalter({Key? key}) : super(key: key);

  @override
  State<MyBuhgalter> createState() => _MyBuhgalterState();
}

class _MyBuhgalterState extends State<MyBuhgalter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Бухгалтер",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Container(
                  // margin: EdgeInsets.only(right: 100),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 0),
                Container(
                  width: 40,
                  height: 40,
                  // margin: EdgeInsets.only(right: 20),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://static.vecteezy.com/system/resources/previews/021/079/672/original/user-account-icon-for-your-design-only-free-png.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Column(
              children: <Widget>[
                EmployesSection(),
                SizedBox(height: 35),
                PaySection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
