import 'package:flutter/material.dart';

class FlowWidget extends StatefulWidget {
  const FlowWidget({super.key});

  @override
  State<FlowWidget> createState() => _FlowWidgetState();
}

class _FlowWidgetState extends State<FlowWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastIconClicked = Icons.notifications;
  List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  @override
  void initState() {
    menuAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flow(
        delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
        children: menuItems
            .map<Widget>(
              (IconData icon) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: FloatingActionButton(
                  backgroundColor:
                      lastIconClicked == icon ? Colors.amber : Colors.grey,
                  splashColor: Colors.amber,
                  onPressed: () {
                    if (icon != Icons.menu) {
                      setState(() {
                        lastIconClicked = icon;
                      });
                    }
                    menuAnimation.status == AnimationStatus.completed
                        ? menuAnimation.reverse()
                        : menuAnimation.forward();
                  },
                  child: Icon(icon),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> menuAnimation;
  FlowMenuDelegate({required this.menuAnimation});

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(dx * menuAnimation.value, 0, 0),
      );
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }
}
