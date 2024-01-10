class FavoriteListModel {
  static List<String> itemNames = [
    'Admod Ads',
    'Android Studio',
  ];

  static List<String> itemSubtitle = [
    'some courses for any developer',
    'some courses for any developer',
  ];

  static List<String> itemImages = [
    ("assets/admob.jpg"),
    ("assets/android.jpg"),
  ];

  Item getById(int id) => Item(
        id,
        itemNames[id % itemNames.length],
        itemSubtitle[id % itemSubtitle.length],
        itemImages[id % itemImages.length],
      );

  Item getByPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final String subtitle;
  final String image;

  const Item(
    this.id,
    this.name,
    this.subtitle,
    this.image,
  );

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
