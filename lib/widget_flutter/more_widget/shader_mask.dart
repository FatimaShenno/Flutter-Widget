import 'package:flutter/material.dart';

class ShaderMaskWidget extends StatelessWidget {
  const ShaderMaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ShaderMask(
      //to show the color without image or any widget
      //  blendMode: BlendMode.src,

      blendMode: BlendMode.color,
      shaderCallback: (rect) => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.blue,
          Colors.green,
        ],
      ).createShader(rect),
      child: Image.asset('assets/images/fruit1.jpg'),
    ));
  }
}
