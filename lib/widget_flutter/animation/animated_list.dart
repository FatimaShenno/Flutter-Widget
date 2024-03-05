import 'package:flutter/material.dart';

class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({Key? key}) : super(key: key);

  @override
  _AnimatedListWidgetState createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  final _items = <String>[];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void addItems() {
    _items.insert(0, "Items ${_items.length + 1}");
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void removeItems(int index) {
    // remove from currentState
    _key.currentState!.removeItem(
      index,
      (_, animation) => SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color: Colors.red,
          child: ListTile(
            title: Text(
              'Deleted',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
      duration: const Duration(milliseconds: 300),
    );
    // remove from list

    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        IconButton(onPressed: addItems, icon: const Icon(Icons.add)),
        Expanded(
          child: AnimatedList(
            key: _key,
            initialItemCount: _items.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                key: UniqueKey(),
                sizeFactor: animation,
                child: Card(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      _items[index],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        removeItems(index);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
