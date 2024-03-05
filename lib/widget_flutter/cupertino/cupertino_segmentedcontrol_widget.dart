import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSegmentedControlWidget extends StatefulWidget {
  const CupertinoSegmentedControlWidget({super.key});

  @override
  State<CupertinoSegmentedControlWidget> createState() =>
      _CupertinoSegmentedControlWidgetState();
}

class _CupertinoSegmentedControlWidgetState
    extends State<CupertinoSegmentedControlWidget> {
  String? currentText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CupertinoSegmentedControl(
              children: {
                'flutter': Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  color: currentText == 'flutter' ? Colors.blue : Colors.grey,
                  child: const Text('flutter platform'),
                ),
                'python': Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  color: currentText == 'python' ? Colors.blue : Colors.grey,
                  child: const Text('python language'),
                ),
                'java': Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  color: currentText == 'java' ? Colors.blue : Colors.grey,
                  child: const Text('java language'),
                ),
              },
              onValueChanged: (String value) {
                setState(() {
                  currentText = value;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            currentText != null
                ? Text(
                    '$currentText',
                    style: const TextStyle(fontSize: 20),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
