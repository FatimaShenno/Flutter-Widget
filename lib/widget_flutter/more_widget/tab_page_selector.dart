import 'package:flutter/material.dart';

List<Widget> widgets = const [
  Text(
    'Page 1',
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  Text(
    'Page 2',
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  Text(
    'Page 3',
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
];

class TabPageSelectorWidget extends StatefulWidget {
  const TabPageSelectorWidget({super.key});

  @override
  State<TabPageSelectorWidget> createState() => _TabPageSelectorWidgetState();
}

class _TabPageSelectorWidgetState extends State<TabPageSelectorWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  int _index = 0;

  @override
  void initState() {
    _controller = TabController(
        length: widgets.length, initialIndex: _index, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            TabBarView(controller: _controller, children: widgets),
            Positioned(
              bottom: 40,
              child:
                  TabPageSelector(controller: _controller, color: Colors.green),
            ),
          ],
        ),
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton.small(
            onPressed: () {
              (_index != widgets.length - 1) ? _index++ : _index = 0;
              _controller.animateTo(_index);
            },
            hoverElevation: 0,
            elevation: 0,
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
