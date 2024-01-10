import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:practice_project/routes/route_generator.dart';

import 'routes/app_roures.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('news_box');
  await Hive.initFlutter();
  await Hive.openBox('teachers_box');
  await Hive.initFlutter();
  await Hive.openBox('buhgalter_box');
  await Hive.initFlutter();
  await Hive.openBox('oplata_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
