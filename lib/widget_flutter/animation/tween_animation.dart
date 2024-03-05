import 'package:flutter/material.dart';

class TweenAnimationWidget extends StatefulWidget {
  const TweenAnimationWidget({super.key});

  @override
  State<TweenAnimationWidget> createState() => _TweenAnimationWidgetState();
}

class _TweenAnimationWidgetState extends State<TweenAnimationWidget> {
  double targetValue = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: targetValue),
          duration: const Duration(milliseconds: 300),
          builder: (BuildContext context, double size, Widget? child) {
            return IconButton(
              onPressed: () {
                setState(() {
                  targetValue = targetValue == 100 ? 250 : 100;
                });
              },
              icon: const Icon(Icons.emoji_food_beverage_outlined),
              iconSize: size,
              color: Colors.amber,
            );
          },
        ),
      ),
    );
  }
}
