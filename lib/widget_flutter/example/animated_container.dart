import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  // late AnimationController _controller;
  // late Animation<double> _animation;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller =
  //       AnimationController(duration: const Duration(seconds: 1), vsync: this);
  // }

  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              click = !click;
            });
          },
          child: Stack(
            children: [
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  )),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                height: 200,
                width: click ? MediaQuery.of(context).size.width * 1 : 0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// way #2
// import 'package:flutter/material.dart';

// class SlideAnimation extends StatefulWidget {
//   const SlideAnimation({super.key});

//   @override
//   State<SlideAnimation> createState() => _SlideAnimationState();
// }

// class _SlideAnimationState extends State<SlideAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//         duration: const Duration(milliseconds: 200), vsync: this);
//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
//   }

//   bool click = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: GestureDetector(
//           onTap: () {
//             setState(() {
//               click = !click;
//               if (click) {
//                 _controller.forward();
//               } else {
//                 _controller.reverse();
//               }
//             });
//           },
//           child: Stack(
//             children: [
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.amber,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               AnimatedBuilder(
//                 animation: _controller,
//                 builder: (context, child) {
//                   return ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(
//                       height: 200,
//                       width:
//                           MediaQuery.of(context).size.width * _animation.value,
//                       color: Colors.blue,
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
