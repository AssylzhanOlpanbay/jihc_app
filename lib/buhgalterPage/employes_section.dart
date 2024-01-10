import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('buhgalter_box');
}

class EmployesSection extends StatefulWidget {
  @override
  State<EmployesSection> createState() => _EmployesSectionState();
}

class _EmployesSectionState extends State<EmployesSection> {
  final TextEditingController _dolzhnostController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  List<Map<String, dynamic>> _items = [];

  void _refreshItems() {
    final data = _buhgalterBox.keys.map((key) {
      final item = _buhgalterBox.get(key);
      return {
        "key": key,
        "dolzhnost": item['dolzhnost'],
        "name": item['name'],
        "phone_number": item['phone_number']
      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
    });
  }

  final _buhgalterBox = Hive.box('buhgalter_box');

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _buhgalterBox.add(newItem);
    _refreshItems();
  }

  void _showForm(BuildContext ctx, int? itemKey) async {
    if (itemKey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemKey);
      _dolzhnostController.text = existingItem['dolzhnost'];
      _nameController.text = existingItem['name'];
      _phoneNumberController.text = existingItem['phone_number'];
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
              controller: _dolzhnostController,
              decoration: const InputDecoration(hintText: "Profession"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(hintText: "Phone number"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (itemKey == null) {
                  _createItem({
                    "dolzhnost": _dolzhnostController.text,
                    "name": _nameController.text,
                    "phone_number": _phoneNumberController.text
                  });
                }

                _dolzhnostController.text = '';
                _nameController.text = '';
                _phoneNumberController.text = '';

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
              onPressed: () => _showForm(context, null),
              child: const Icon(Icons.add),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final currentItem = _items[index];
                return Card(
                  child: employesList(
                    context: context,
                    index: index,
                    dolzhnost: currentItem['dolzhnost'],
                    name: currentItem['name'],
                    phoneNumber: currentItem['phone_number'],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget employesList({
    required BuildContext context,
    required int index,
    required String dolzhnost,
    required String name,
    required String phoneNumber,
  }) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 55,
      child: Row(
        children: [
          SizedBox(
            width: 175,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dolzhnost,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 0),
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.call,
                  size: 25,
                  color: Colors.green,
                ),
                SizedBox(width: 10),
                Text(
                  phoneNumber,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
