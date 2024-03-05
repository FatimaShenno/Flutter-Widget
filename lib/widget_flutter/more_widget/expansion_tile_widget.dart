import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatefulWidget {
  const ExpansionTileWidget({super.key});

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  bool _customIcon = false;

  // you can delete the trailing and setstate in onExpansionChanged
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ExpansionTile(
          title: const Text("Expansion Tile"),
          trailing: Icon(_customIcon
              ? Icons.arrow_drop_down_circle
              : Icons.arrow_drop_down),
          onExpansionChanged: (bool expanded) {
            setState(() => _customIcon = expanded);
          },
          //if dont using trailing, yo can use controlAffinity, the icon will be in the first
          // controlAffinity:ListTileControlAffinity.leading ,
          children: const <Widget>[
            ListTile(
              title: Text('This is tile number'),
            )
          ],
        )
      ]),
    );
  }
}
