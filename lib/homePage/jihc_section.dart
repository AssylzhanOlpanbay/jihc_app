import 'package:flutter/material.dart';

import '../routes/app_roures.dart';

class JIHCSection extends StatefulWidget {
  const JIHCSection({super.key});

  @override
  State<JIHCSection> createState() => _JIHCSectionState();
}

class _JIHCSectionState extends State<JIHCSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(
              width: 30,
              height: 30,
              child: const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
                child: Text(
                  "J",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Text(
              "IHC",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.buhgalter);
                    },
                    child: Container(
                      width: 175,
                      height: 110,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(50),
                      // ),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(15), // Image border
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(90), // Image radius
                              child: Image.network(
                                'https://img.freepik.com/premium-photo/black-office-desk-laptop-calculator-notepad-top-view-free-space-your-text_187166-33264.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 45,
                            left: 22,
                            child: Text(
                              "Бухгалтерия",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.video);
                    },
                    child: Container(
                      width: 175,
                      height: 110,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(50),
                      // ),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(15), // Image border
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(90), // Image radius
                              child: Image.network(
                                'https://i.pinimg.com/originals/ed/9d/1e/ed9d1eb5dcbeb81cae50fea27ac7e099.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 45,
                            left: 30,
                            child: Text(
                              "Үйірмелер",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 175,
                    height: 110,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(50),
                    // ),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(15), // Image border
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(90), // Image radius
                            child: Image.network(
                              'https://res.cloudinary.com/dgg9enyjv/image/upload/q_auto/f_auto/ar_1.5,c_fill/w_1600/v1629722986/Magnet/Kitchens/Integra%20Hoxton/VM1004_MAGNET_MAY_2021_SC06_INTEGRA_HOXTON_MIDNIGHT_METALLIC_S01_ADOBE_98',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 45,
                          left: 50,
                          child: Text(
                            "Асхана",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 175,
                    height: 110,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(50),
                    // ),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(15), // Image border
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(90), // Image radius
                            child: Image.network(
                              'https://images.trvl-media.com/lodging/19000000/18360000/18354900/18354839/201fdd81.jpg?impolicy=resizecrop&rw=500&ra=fit',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 45,
                          left: 30,
                          child: Text(
                            "Жатақхана",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
