import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertionPickerWidget extends StatefulWidget {
  const CupertionPickerWidget({super.key});

  @override
  State<CupertionPickerWidget> createState() => _CupertionPickerWidgetState();
}

class _CupertionPickerWidgetState extends State<CupertionPickerWidget> {
  double selectValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              onPressed: () => showCupertinoModalPopup(
                  context: context,
                  builder: (_) => SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: CupertinoPicker(
                          backgroundColor: Colors.amber,
                          itemExtent: 30,
                          onSelectedItemChanged: (index) {
                            setState(
                              () {
                                selectValue = index.toDouble();
                              },
                            );
                          },
                          scrollController: FixedExtentScrollController(
                            initialItem: 1,
                          ),
                          children: const [
                            Text(
                              '0',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '1',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '2',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      )),
              child: Text('Value = $selectValue'),
            ),
          ],
        ),
      )),
    );
  }
}
