import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DragTargetWidget extends StatelessWidget {
  DragTargetWidget({super.key});

  Color caughtColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // الذي سيتم سحبه
              Draggable(
                data: Colors.amber,
                // وقت سحب الكونتينر
                feedback: Container(
                  height: 150,
                  width: 150,
                  color: Colors.amber.withOpacity(0.5),
                  child: const Center(
                      child: Text(
                    'Box...',
                    style: TextStyle(
                        fontSize: 18, decoration: TextDecoration.none),
                  )),
                ),
                onDraggableCanceled: (velocity, offset) {},
                // الكونتينر الذي سيتم سحبه
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.amber,
                  child: const Center(child: Text('box')),
                ),
              ),
              // المكان الذي سيتم وضع الكونتينر المسحوب (الهدف)
              DragTarget(
                // لون الكونتينر الهدف
                onAccept: (Color color) {
                  caughtColor = color;
                },
                builder: (BuildContext context, List<dynamic> accepted,
                    List<dynamic> rejected) {
                  return Container(
                    height: 200,
                    width: 200,
                    // لما أحط الكونتينر المسحوب فوق الهدف يأخذ اللون لثواني
                    color: accepted.isEmpty
                        ? caughtColor
                        : caughtColor = Colors.grey,
                    child: const Center(child: Text('Drag here')),
                  );
                },
              )
            ]),
      ),
    );
  }
}
