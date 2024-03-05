import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool selected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 100,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                selected = !selected;
              });
            },
            child: const Text(
              "Switch",
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Image.asset(
              'assets/images/fruit1.jpg',
              width: double.infinity,
            ),
            secondChild: Image.asset(
              'assets/images/fruit2.jpg',
              width: double.infinity,
            ),
            duration: const Duration(seconds: 2),
            crossFadeState:
                selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ],
      ),
    );
  }
}
