import 'package:flutter/material.dart';

class PositionedTransitionWidget extends StatefulWidget {
  const PositionedTransitionWidget({super.key});

  @override
  State<PositionedTransitionWidget> createState() =>
      _PositionedTransitionWidgetState();
}

class _PositionedTransitionWidgetState extends State<PositionedTransitionWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double bigLogo = 200;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final Size biggest = constraints.biggest;
      return Stack(
        children: [
          PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromSize(
                  Rect.fromLTWH(biggest.width / 2 - smallLogo / 2, 0, smallLogo,
                      smallLogo),
                  biggest),
              end: RelativeRect.fromSize(
                  Rect.fromLTWH(biggest.width / 2 - bigLogo / 2,
                      biggest.height - bigLogo, bigLogo, bigLogo),
                  biggest),
            ).animate(
                CurvedAnimation(parent: _controller, curve: Curves.slowMiddle)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
