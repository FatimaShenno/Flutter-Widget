import 'package:flutter/material.dart';

class AnimatedPositionWidget1 extends StatefulWidget {
  const AnimatedPositionWidget1({super.key});

  @override
  State<AnimatedPositionWidget1> createState() =>
      _AnimatedPositionWidget1State();
}

class _AnimatedPositionWidget1State extends State<AnimatedPositionWidget1> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 200,
        height: 350,
        child: Stack(children: [
          AnimatedPositioned(
            width: isSelected ? 200 : 100,
            height: isSelected ? 50 : 200,
            top: isSelected ? 50 : 150,
            duration: const Duration(seconds: 2),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
