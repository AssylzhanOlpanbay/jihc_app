import 'package:flutter/material.dart';
import 'package:practice_project/notificationPage/models/favorite_page_models.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite page",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: _FavoritePagesList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoritePagesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline5;
    var favoritepage = context.watch<FavoritePageModel>();

    return ListView.builder(
      itemCount: favoritepage.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            favoritepage.remove(favoritepage.items[index]);
          },
        ),
        title: Text(
          favoritepage.items[index].name,
          style: itemNameStyle,
        ),
        subtitle: Text(
          favoritepage.items[index].subtitle,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }
}
