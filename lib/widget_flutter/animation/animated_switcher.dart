import 'dart:math';

import 'package:flutter/material.dart';

// class AnimatedSwitcherWidget extends StatefulWidget {
//   const AnimatedSwitcherWidget({super.key});

//   @override
//   State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
// }

// class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
//   double count = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           AnimatedSwitcher(
//             duration: const Duration(seconds: 1),
//             // to add other animation
//             transitionBuilder: (child, animation) {
//               return ScaleTransition(
//                 scale: animation,
//                 child: child,
//               );
//             },
//             // key : for animation
//             child: Text(
//               '$count',
//               key: ValueKey(count),
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   count += 1;
//                 });
//               },
//               child: const Text('Add'))
//         ],
//       )),
//     );
//   }
// }

//EXample #2

class DemoAnimatedSwitcher extends StatefulWidget {
  DemoAnimatedSwitcher({Key? key}) : super(key: key);

  @override
  _DemoAnimatedSwitcherState createState() => _DemoAnimatedSwitcherState();
}

class _DemoAnimatedSwitcherState extends State<DemoAnimatedSwitcher> {
  bool switchChild = true;

  @override
  Widget build(BuildContext context) {
    List colors = [
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.pink,
      Colors.blue,
      Colors.amber,
      Colors.deepPurple
    ];
    Random random = Random();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 3),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: switchChild
                  ? Container(
                      key: UniqueKey(),
                      height: 90.0,
                      width: 90.0,
                      color: colors[random.nextInt(colors.length)],
                    )
                  : Container(
                      key: UniqueKey(),
                      height: 140.0,
                      width: 140.0,
                      color: colors[random.nextInt(colors.length)],
                    ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                switchChild = !switchChild;
              });
            },
            child: const Text('Click'),
          ),
        ],
      ),
    );
  }
}


// The key parameter is utilized to facilitate smooth animated transitions between child widgets within the AnimatedSwitcher by providing unique identifiers for each child.
