import 'package:flutter/material.dart';

class AnimatedPhysicalModelWidget extends StatefulWidget {
  const AnimatedPhysicalModelWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedPhysicalModelWidget> createState() =>
      _AnimatedPhysicalModelWidgetState();
}

class _AnimatedPhysicalModelWidgetState
    extends State<AnimatedPhysicalModelWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _colorAnimation = ColorTween(
      begin: Colors.white.withOpacity(0.5),
      end: Colors.white.withOpacity(1),
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return PhysicalModel(
                color: Colors.black,
                shadowColor: Colors.white,
                shape: BoxShape.circle,
                elevation: _animation.value * 10,
                child: CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.apple,
                    size: 40,
                    // this line to not use another animation
                    //color: Colors.white.withOpacity(_animation.value),
                    color: _colorAnimation.value,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
