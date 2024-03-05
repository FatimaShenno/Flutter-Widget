import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _controller.addListener(() {
      if (_controller.isCompleted) {
        Navigator.of(context).push(
          // MaterialPageRoute(
          //   builder: (context) => const Destination(),
          // ),

          // CupertinoPageRoute(builder: (context) => const Destination(),)

          MyCustomRouteTransition(route: const Destination()),
        );

        Timer(const Duration(milliseconds: 500), () {
          _controller.reset();
        });
      }
    });
    _scaleAnimation = Tween<double>(begin: 1, end: 10).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Go Back'),
      ),
      body: const Center(child: Text('Hello World')),
    );
  }
}

// if i have 20 screen

class MyCustomRouteTransition extends PageRouteBuilder {
  final Widget route;
  MyCustomRouteTransition({required this.route})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => route,
          // child is route (Destination page)
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              // to use slidetransition, using Tween >> final tween  Tween(begin: Offset(0,-1),end: (Offset.zero)).animate(animation);
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
