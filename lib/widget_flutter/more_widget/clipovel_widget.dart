import 'package:flutter/material.dart';

class ClipOvalWidget extends StatelessWidget {
  const ClipOvalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset('assets/images/fruit1.jpg', fit: BoxFit.cover),
              clipper: CustomClip(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width - 15, size.height);
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}

// ClipOval is one of the features in Flutter that allows us to clip a child widget in an oval or circular shape. 
//We can also change the width and height of the child widget 
//(by keeping the width and height, we obtain a circular shape).