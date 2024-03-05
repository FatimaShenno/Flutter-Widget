import 'package:flutter/material.dart';

class IndexedStackWidget extends StatefulWidget {
  const IndexedStackWidget({super.key});

  @override
  State<IndexedStackWidget> createState() => _IndexedStackWidgetState();
}

class _IndexedStackWidgetState extends State<IndexedStackWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: const Text('bt 0'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: const Text('bt 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    index = 2;
                  },
                  child: const Text('bt 2'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            IndexedStack(
              index: index,
              children: [
                Center(
                  child: Image.asset('assets/images/fruit1.jpg'),
                ),
                Center(
                  child: Image.asset('assets/images/fruit2.jpg'),
                ),
                Center(
                  child: Image.asset('assets/images/fruit1.jpg'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
