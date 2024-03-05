import 'package:flutter/material.dart';

final ValueNotifier<int> number = ValueNotifier(0);

class ValueListenableBuilderWidget extends StatelessWidget {
  const ValueListenableBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                number.value += 1;
              },
              icon: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: number,
              builder: (BuildContext context, int value, Widget? child) {
                return Text('$value');
              },
            ),
          ],
        ),
      ),
    );
  }
}
