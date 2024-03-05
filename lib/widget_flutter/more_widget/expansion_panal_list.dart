import 'package:flutter/material.dart';

class Items {
  String headerText;
  String expandedText;
  bool isExpanded;

  Items(
      {required this.headerText,
      required this.expandedText,
      this.isExpanded = false});
}

class ExpansionPanalListWidget extends StatefulWidget {
  const ExpansionPanalListWidget({super.key});

  @override
  State<ExpansionPanalListWidget> createState() =>
      _ExpansionPanalListWidgetState();
}

class _ExpansionPanalListWidgetState extends State<ExpansionPanalListWidget> {
  final List<Items> _data = List<Items>.generate(10, (index) {
    return Items(
      headerText: 'item $index',
      expandedText: 'this is item number $index',
    );
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        animationDuration: const Duration(seconds: 2),
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            _data[panelIndex].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((item) {
          return ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(item.headerText),
              );
            },
            body: ListTile(
              title: Text(item.expandedText),
              subtitle: const Text('To delete this item, click trash icon'),
              trailing: const Icon(Icons.delete, color: Colors.grey),
              onTap: () {
                setState(() {
                  _data.removeWhere((Items currentItem) => item == currentItem);
                });
              },
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
