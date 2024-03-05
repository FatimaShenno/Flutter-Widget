import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatefulWidget {
  const AnimatedIconWidget({super.key});

  @override
  State<AnimatedIconWidget> createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with TickerProviderStateMixin {
  bool isPlay = false;
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..forward()
          ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            //  If I need to move dynamically, use helper animation, Animation animation = Tween .....
            // If I need to move by click, use this code without using helper animation
            //w1
            // isPlay = !isPlay;
            // isPlay ? _controller.forward() : _controller.reverse();
            // w2
            // if (isPlay == false) {
            //   setState(() {
            //     _controller.forward();
            //     isPlay = true;
            //   });
            // } else {
            //   setState(() {
            //     _controller.reverse();
            //     isPlay = false;
            //   });
            // }
          },
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _controller,
            size: 50,
            color: Colors.blue,
            semanticLabel: 'Play/Pause',
          ),
        ),
      ),
    );
  }
}

// The progress property should be linked to an animation controller, allowing us to control the animation's progress.
