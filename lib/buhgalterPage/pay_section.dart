import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('oplata_box');
}

class PaySection extends StatefulWidget {
  const PaySection({super.key});

  @override
  State<PaySection> createState() => _PaySectionState();
}

class _PaySectionState extends State<PaySection> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _summaController = TextEditingController();

  List<Map<String, dynamic>> _itemsOplata = [];

  void _refreshItemsOplata() {
    final data = _oplataBox.keys.map((key) {
      final item = _oplataBox.get(key);
      return {
        "key": key,
        "title": item['title'],
        "date": item['date'],
        "summa": item['summa']
      };
    }).toList();

    setState(() {
      _itemsOplata = data.reversed.toList();
      print(_itemsOplata.length);
    });
  }

  final _oplataBox = Hive.box('oplata_box');

  @override
  void initState() {
    super.initState();
    _refreshItemsOplata();
  }

  Future<void> _createItemOplata(Map<String, dynamic> newItem) async {
    await _oplataBox.add(newItem);
    _refreshItemsOplata();
  }

  Future<void> _updateItemOplata(int itemKey, Map<String, dynamic> item) async {
    await _oplataBox.put(itemKey, item);
    _refreshItemsOplata();
  }

  void _showFormOplata(BuildContext ctx, int? itemKey) async {
    if (itemKey != null) {
      final existingItem =
          _itemsOplata.firstWhere((element) => element['key'] == itemKey);
      _titleController.text = existingItem['title'];
      _dateController.text = existingItem['date'];
      _summaController.text = existingItem['summa'];
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
              decoration: const InputDecoration(hintText: "Тақырыбы"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(hintText: "Күні"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _summaController,
              decoration: const InputDecoration(hintText: "Сумма"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (itemKey == null) {
                  _createItemOplata({
                    "title": _titleController.text,
                    "date": _dateController.text,
                    "summa": _summaController.text
                  });
                }

                if (itemKey != null) {
                  _updateItemOplata(itemKey, {
                    'title': _titleController.text.trim(),
                    'subtitle': _dateController.text.trim(),
                    'photo_link': _summaController.text.trim()
                  });
                }

                _titleController.text = '';
                _dateController.text = '';
                _summaController.text = '';

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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              onPressed: () => _showFormOplata(context, null),
              child: const Icon(Icons.add),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _itemsOplata.length,
              itemBuilder: (context, index) {
                final currentItem = _itemsOplata[index];
                return Card(
                  child: payList(
                    context: context,
                    index: index,
                    title: currentItem['title'],
                    date: currentItem['date'],
                    summa: currentItem['summa'],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget payList({
    required BuildContext context,
    required int index,
    required String title,
    required String date,
    required String summa,
  }) {
    final currentItem = _itemsOplata[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  child: Text(
                    date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Spacer(),
                const Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.white,
                  size: 35,
                ),
                SizedBox(width: 10),
                Text(
                  summa,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, size: 20),
                  onPressed: () => _showFormOplata(context, currentItem["key"]),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
