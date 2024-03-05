import 'dart:math';

import 'package:flutter/material.dart';

class TransformWidget extends StatelessWidget {
  const TransformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Transform(
        transform: Matrix4.rotationZ(pi * 1 / 4),
        child: Image.asset('assets/images/fruit1.jpg'),
      )),
    );
  }
}
