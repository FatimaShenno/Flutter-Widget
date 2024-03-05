import 'package:flutter/material.dart';

class AnimatedRotationWidget extends StatefulWidget {
  const AnimatedRotationWidget({super.key});

  @override
  State<AnimatedRotationWidget> createState() => _AnimatedRotationWidgetState();
}

class _AnimatedRotationWidgetState extends State<AnimatedRotationWidget> {
  double turn = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: AnimatedRotation(
                turns: turn,
                duration: const Duration(seconds: 1),
                child: const FlutterLogo(),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    turn += 1 / 4;
                  });
                },
                child: const Text('Rotate Logo'))
          ],
        ),
      ),
    );
  }
}
