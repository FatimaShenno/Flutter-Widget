import 'package:flutter/material.dart';

class BaseLineWidget extends StatelessWidget {
  const BaseLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello World',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Baseline(
                baseline: -5,
                baselineType: TextBaseline.alphabetic,
                child: Text('welcome'),
              ),
            ],
          )
        ],
      )),
    );
  }
}
