// Import for pagination

import 'package:flutter/material.dart';

class FadeInWidget extends StatelessWidget {
  const FadeInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/fruit1.jpg',
            image: 'https://picsum.photos/250?image=9'),
      ),
    );
  }
}
