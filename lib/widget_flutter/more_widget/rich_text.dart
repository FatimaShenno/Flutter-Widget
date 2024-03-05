import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RichText(
        text: const TextSpan(style: TextStyle(color: Colors.blue), children: [
          TextSpan(text: 'Welcome to'),
          TextSpan(text: ' Future', style: TextStyle(color: Colors.amber))
        ]),
      )),
    );
  }
}
