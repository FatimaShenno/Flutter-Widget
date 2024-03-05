import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(text: 'TabBar 1'),
            Tab(text: 'TabBar 2'),
            Tab(text: 'TabBar 3'),
          ]),
          title: const Text('Flutter Widget'),
        ),
        body: TabBarView(children: [
          Container(
            color: Colors.orangeAccent,
            child: const Center(
              child: Text(
                'TabBarView 1',
              ),
            ),
          ),
          Container(
            color: Colors.redAccent,
            child: const Center(child: Text('TabBarView 2')),
          ),
          Container(
            color: Colors.greenAccent,
            child: const Center(child: Text('TabBarView 3')),
          ),
        ]),
      ),
    );
  }
}
