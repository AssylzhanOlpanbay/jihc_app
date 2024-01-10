import 'package:flutter/material.dart';

import '../routes/app_roures.dart';

class ProfilePage extends StatelessWidget {
  String photo_link, id, name, group, profession, iin;

  ProfilePage({
    required this.photo_link,
    required this.id,
    required this.name,
    required this.group,
    required this.profession,
    required this.iin,
  });
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Профиль",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.home,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.home);
          },
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          children: [
            Container(
              width: 230,
              height: 275,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(90), // Image radius
                  child: Image.network(
                    photo_link,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ID:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Аты-жөні:",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Тобы:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Пәні:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "ИИН:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        id,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        group,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        profession,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        iin,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
