import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSliderWidget extends StatefulWidget {
  const CupertinoSliderWidget({super.key});

  @override
  State<CupertinoSliderWidget> createState() => _CupertinoSliderWidgetState();
}

class _CupertinoSliderWidgetState extends State<CupertinoSliderWidget> {
  double currentValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(currentValue.toString()),
          const SizedBox(height: 20),
          CupertinoSlider(
            value: currentValue,
            onChanged: (selectedvalue) {
              setState(() {
                currentValue = selectedvalue;
              });
            },
            activeColor: Colors.grey,
            thumbColor: Colors.amber,
            min: 0,
            max: 50,
            divisions: 10,
          )
        ]),
      ),
    );
  }
}
