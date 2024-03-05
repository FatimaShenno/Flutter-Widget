import 'package:flutter/material.dart';

class AnimatedPaddingWidget extends StatefulWidget {
  const AnimatedPaddingWidget({super.key});

  @override
  State<AnimatedPaddingWidget> createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  double paddindVal = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    paddindVal = paddindVal == 0.0 ? 100.0 : 0.0;
                  });
                },
                child: const Text('Change padding value')),
            const SizedBox(
              height: 20,
            ),
            Text('Padding value: $paddindVal'),
            const SizedBox(
              height: 10,
            ),
            AnimatedPadding(
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOutCubic,
              padding: EdgeInsets.all(paddindVal),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    );
  }
}
