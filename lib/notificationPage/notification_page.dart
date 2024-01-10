import 'package:flutter/material.dart';
import 'package:practice_project/notificationPage/models/favorite_list_models.dart';
import 'package:practice_project/notificationPage/models/favorite_page_models.dart';
import 'package:practice_project/notificationPage/screens/favorite_page.dart';
import 'package:provider/provider.dart';

import '../notificationPage/screens/favorite_list.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FavoriteListModel()),
        ChangeNotifierProxyProvider<FavoriteListModel, FavoritePageModel>(
          create: (context) => FavoritePageModel(),
          update: (context, favoritelist, favoritepage) {
            if (favoritepage == null)
              throw ArgumentError.notNull('favoritepage');
            favoritepage.favoritelist = favoritelist;
            return favoritepage;
          },
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Favorite Provider',
          initialRoute: '/',
          routes: {
            '/': (context) => FavoriteList(),
            '/favoritepage': (context) => FavoritePage(),
          }),
    );
  }
}
