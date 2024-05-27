import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String text = 'Item 1';

  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  List<String> itemsForListView = List.generate(5, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: text);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            'Homepage',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                      labelText: 'Enter your name',
                      border: OutlineInputBorder()))),
          DropdownButton(
              value: text,
              items: items
                  .map((item) => DropdownMenuItem(
                        key: Key(item),
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (selectedItem) {
                setState(() {
                  controller.text = selectedItem.toString();
                  text = selectedItem.toString();
                });
                // show a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(selectedItem ?? 'No item selected'),
                  ),
                );
              }),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  onTap: () {
                    setState(() {
                      controller.text = items[index];
                      text = items[index];
                    });
                  },
                );
              },
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Submit'))
        ]));
  }
}
