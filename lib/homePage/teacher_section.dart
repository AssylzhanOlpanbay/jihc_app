import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('teachers_box');
}

class TeacherSection extends StatefulWidget {
  const TeacherSection({super.key});

  @override
  State<TeacherSection> createState() => _TeacherSectionState();
}

class _TeacherSectionState extends State<TeacherSection> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _photoLinkController = TextEditingController();

  List<Map<String, dynamic>> _items = [];

  void _refreshItems() {
    final data = _teachersBox.keys.map((key) {
      final item = _teachersBox.get(key);
      return {
        "key": key,
        "title": item['title'],
        "photo_link": item['photo_link']
      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
    });
  }

  final _teachersBox = Hive.box('teachers_box');

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _teachersBox.add(newItem);
    _refreshItems();
  }

  // Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
  //   await _newsBox.put(itemKey, item);
  //   _refreshItems();
  // }
  //
  // Future<void> _deleteItem(int itemKey) async {
  //   await _newsBox.delete(itemKey);
  //   _refreshItems();
  //
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('An item has been deleted')));
  // }

  void _showForm(BuildContext ctx, int? itemKey) async {
    if (itemKey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemKey);
      _titleController.text = existingItem['title'];
      _photoLinkController.text = existingItem['photo_link'];
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
              controller: _photoLinkController,
              decoration: const InputDecoration(hintText: "Photo link"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (itemKey == null) {
                  _createItem({
                    "title": _titleController.text,
                    "photo_link": _photoLinkController.text
                  });
                }

                // if (itemKey != null) {
                //   _updateItem(itemKey, {
                //     'title': _titleController.text.trim(),
                //     'subtitle': _subtitleController.text.trim(),
                //     'photo_link': _photoLinkController.text.trim()
                //   });
                // }

                _titleController.text = '';
                _photoLinkController.text = '';

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
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
                child: Text(
                  "М",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Text(
              "ұғалімдер",
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
                  child: teachersItem(
                      context: context,
                      index: index,
                      photo_link: currentItem['photo_link'],
                      facultet: currentItem['title']),
                );
              }),
        )
      ],
    );
  }
}

Widget teachersItem({
  required BuildContext context,
  required int index,
  required String facultet,
  required String photo_link,
}) {
  return Container(
    width: 175,
    height: 110,
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(50),
    // ),
    child: Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15), // Image border
          child: SizedBox.fromSize(
            size: const Size.fromRadius(90), // Image radius
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.color),
              child: Image.network(
                photo_link,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  facultet,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );

  // return Container(
  //     width: 150,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       boxShadow: const [
  //         BoxShadow(color: Colors.blue, spreadRadius: 5),
  //       ],
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Flexible(
  //               child: Container(
  //                 padding: EdgeInsets.only(right: 13),
  //                 child: Text(
  //                   facultet,
  //                   overflow: TextOverflow.ellipsis,
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 25,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ));
}
