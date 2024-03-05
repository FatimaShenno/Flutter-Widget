import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoScrollBarWidget extends StatelessWidget {
  const CupertinoScrollBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoScrollbar(
        thickness: 6,
        thicknessWhileDragging: 10,
        radius: const Radius.circular(10),
        radiusWhileDragging: Radius.zero,
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) => Center(
            child: Text(
              '$index',
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
