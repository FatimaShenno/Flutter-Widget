import 'package:flutter/material.dart';

class DecoratedBoxTransitionWidget extends StatefulWidget {
  const DecoratedBoxTransitionWidget({super.key});

  @override
  State<DecoratedBoxTransitionWidget> createState() =>
      _DecoratedBoxTransitionWidgetState();
}

class _DecoratedBoxTransitionWidgetState
    extends State<DecoratedBoxTransitionWidget> with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
        color: Colors.white,
        border: Border.all(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(50),
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.black26, spreadRadius: 3.0, offset: Offset(0, 6)),
        ]),
    end: BoxDecoration(
      color: Colors.blue,
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.zero,
    ),
  );
  late AnimationController animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat(reverse: true);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: DecoratedBoxTransition(
            decoration: decorationTween.animate(animationController),
            child: Container(
              width: 250,
              height: 250,
              padding: const EdgeInsets.all(10),
              //Image.asset('assets/images/fruit1.jpg', fit: BoxFit.cover)
              child: const FlutterLogo(
                size: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
