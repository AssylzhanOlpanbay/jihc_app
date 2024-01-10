import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('news_box');
}

class NewsSection extends StatefulWidget {
  const NewsSection({super.key});

  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  final TextEditingController _photoLinkController = TextEditingController();
  final TextEditingController _webLinkController = TextEditingController();

  List<Map<String, dynamic>> _items = [];

  void _refreshItems() {
    final data = _newsBox.keys.map((key) {
      final item = _newsBox.get(key);
      return {
        "key": key,
        "title": item['title'],
        "subtitle": item['subtitle'],
        "photo_link": item['photo_link'],
        "web_link": item['web_link']
      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
    });
  }

  final _newsBox = Hive.box('news_box');

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _newsBox.add(newItem);
    _refreshItems();
  }

  Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
    await _newsBox.put(itemKey, item);
    _refreshItems();
  }

  Future<void> _deleteItem(int itemKey) async {
    await _newsBox.delete(itemKey);
    _refreshItems();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }

  void _showForm(BuildContext ctx, int? itemKey) async {
    if (itemKey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemKey);
      _titleController.text = existingItem['title'];
      _subtitleController.text = existingItem['subtitle'];
      _photoLinkController.text = existingItem['photo_link'];
      _webLinkController.text = existingItem['web_link'];
    }
    showModalBottomSheet(
      context: ctx,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            top: 15,
            left: 15,
            right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: "Title"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _subtitleController,
              decoration: const InputDecoration(hintText: "Subtitle"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _photoLinkController,
              decoration: const InputDecoration(hintText: "Photo link"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _webLinkController,
              decoration: const InputDecoration(hintText: "Web link"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (itemKey == null) {
                  _createItem({
                    "title": _titleController.text,
                    "subtitle": _subtitleController.text,
                    "photo_link": _photoLinkController.text,
                    "web_link": _webLinkController.text
                  });
                }

                if (itemKey != null) {
                  _updateItem(itemKey, {
                    'title': _titleController.text.trim(),
                    'subtitle': _subtitleController.text.trim(),
                    'photo_link': _photoLinkController.text.trim(),
                    'web_link': _webLinkController.text.trim()
                  });
                }

                _titleController.text = '';
                _subtitleController.text = '';
                _photoLinkController.text = '';
                _webLinkController.text = '';

                Navigator.of(context).pop();
              },
              child: Text(itemKey == null ? 'Create new' : 'Update'),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 30,
              height: 30,
              child: const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
                child: Text(
                  "Ж",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Text(
              "аңалықтар",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              onPressed: () => _showForm(context, null),
              child: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final currentItem = _items[index];
                return Card(
                  child: listItem(
                    context: context,
                    index: index,
                    urlPhoto: currentItem['photo_link'],
                    urlLink: currentItem['web_link'],
                    title: currentItem['title'],
                    subtitle: currentItem['subtitle'],
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget listItem({
    required BuildContext context,
    required int index,
    required String urlPhoto,
    required String urlLink,
    required String title,
    required String subtitle,
  }) {
    final currentItem = _items[index];
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.blue, spreadRadius: 3),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(90), // Image radius
                child: Image.network(
                  urlPhoto,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 30),
              child: Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () => _showForm(context, currentItem["key"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () => _deleteItem(currentItem["key"]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final url = Uri.parse(currentItem['web_link']);
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 13),
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
