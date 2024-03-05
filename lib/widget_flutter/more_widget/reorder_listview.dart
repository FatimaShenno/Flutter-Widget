import 'package:flutter/material.dart';

class ReorderableListViewWidget extends StatefulWidget {
  const ReorderableListViewWidget({super.key});

  @override
  State<ReorderableListViewWidget> createState() =>
      _ReorderableListViewWidgetState();
}

class _ReorderableListViewWidgetState extends State<ReorderableListViewWidget> {
  final List<int> items = List.generate(20, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        children: List.generate(
          items.length,
          (index) => ListTile(
            key: Key('$index'),
            tileColor: items[index].isOdd ? Colors.white12 : Colors.white30,
            title: Text(
              'Items  $index',
            ),
            trailing: const Icon(Icons.drag_handle_sharp),
          ),
        ),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
