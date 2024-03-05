import 'package:flutter/material.dart';

class Example4 extends StatefulWidget {
  const Example4({super.key});

  @override
  State<Example4> createState() => _Example4State();
}

class _Example4State extends State<Example4>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;
  List<IconData> icons = [
    Icons.keyboard_arrow_up,
    Icons.keyboard_arrow_up,
    Icons.keyboard_arrow_up
  ];
  List<Color> colors = [
    Colors.black,
    Colors.white,
    Colors.black,
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat();
    _animation = Tween(begin: 0.5, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.redAccent, Colors.orangeAccent])),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return ListView.builder(
                    itemCount: icons.length,
                    itemBuilder: (context, index) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            0, _controller.value * 0.2, 0),
                        child: Icon(
                          icons[index],
                          size: 45,
                          color: Color.lerp(
                            Colors.black,
                            Colors.white,
                            _controller.value,
                            //  _controller.value,
                          ),
                        ),
                      );
                    });
              },
            ),
          )),
        ],
      ),
    );
  }
}


 // late Animation<Offset> _animation;
  // late Animation<double> _animation1;
  // _animation = Tween(begin: const Offset(-1, 1), end: Offset.zero)
    //     .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    // _animation1 = Tween(begin: 0.5, end: 1.0)
    //     .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));



// import 'package:flutter/material.dart';

// class Example4 extends StatefulWidget {
//   const Example4({Key? key}) : super(key: key);

//   @override
//   State<Example4> createState() => _Example4State();
// }

// class _Example4State extends State<Example4>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;

//   List<IconData> icons = [
//     Icons.keyboard_arrow_up,
//     Icons.keyboard_arrow_up,
//     Icons.keyboard_arrow_up
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(duration: const Duration(seconds: 2), vsync: this)
//           ..repeat();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//               height: 175,
//               width: 150,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [Colors.redAccent, Colors.orangeAccent],
//                 ),
//               ),
//               child: ListView.builder(
//                 itemCount: icons.length,
//                 itemBuilder: (context, index) {
//                   // Calculate the color based on the current index
//                   Color? iconColor = Color.lerp(
//                     Colors.black,
//                     Colors.white,
//                     _controller.value,
//                   );

//                   // Calculate the percentage position of the current index
//                   double positionPercentage = index / (icons.length - 1);

//                   // Apply Transform to change the color from bottom to top
//                   return Transform(
//                     transform: Matrix4.identity()
//                       ..setEntry(3, 2, 0.002) // Perspective
//                       ..translate(
//                           0.0, 0.0, positionPercentage * 50.0) // Z translation
//                       ..scale(1.0 - positionPercentage * 0.5), // Scale
//                     child: ListTile(
//                       title: Icon(
//                         icons[index],
//                         size: 45,
//                         color: iconColor,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
