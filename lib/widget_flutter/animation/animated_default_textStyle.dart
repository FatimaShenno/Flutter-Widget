import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  const AnimatedDefaultTextStyleWidget({super.key});

  @override
  State<AnimatedDefaultTextStyleWidget> createState() =>
      _AnimatedDefaultTextStyleWidgetState();
}

class _AnimatedDefaultTextStyleWidgetState
    extends State<AnimatedDefaultTextStyleWidget> {
  double? _fontSize;
  Color? _color;
  bool first = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              style: TextStyle(fontSize: _fontSize, color: _color),
              duration: const Duration(milliseconds: 200),
              child: const Text('Flutter'),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _fontSize = first ? 60 : 20;
                    _color = first ? Colors.blue : Colors.green;
                    first = !first;
                  });
                },
                child: const Text('Switch'))
          ],
        ),
      ),
    );
  }
}
