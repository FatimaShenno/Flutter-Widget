import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValueListenableBuilderExample extends StatefulWidget {
  const ValueListenableBuilderExample({super.key});

  @override
  State<ValueListenableBuilderExample> createState() =>
      _ValueListenableBuilderExampleState();
}

class _ValueListenableBuilderExampleState
    extends State<ValueListenableBuilderExample>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> _scrollValue = ValueNotifier<double>(0.0);
  final ScrollController _scrollController = ScrollController();

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  //late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _scrollValue.value = _scrollController.offset;
    });

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.bounceInOut));
    // _fadeAnimation =CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.grey,
              pinned: true,
              floating: true,
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/fruit1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              actions: [
                ValueListenableBuilder(
                    valueListenable: _scrollValue,
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          switchInCurve: Curves.easeIn,
                          switchOutCurve: Curves.easeInOut,
                          child: Icon(
                            value > 150
                                ? Icons.search
                                : Icons.document_scanner_sharp,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoSearchTextField(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color:
                          Colors.orangeAccent, // Set the color for the border
                      width: 1.0, // Set the width of the border
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return ListTile(
                  title: RichText(
                    text: TextSpan(
                      text: 'Item ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                            text: ' $index',
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                );
              }, childCount: 100),
            ),
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder(
          valueListenable: _scrollValue,
          builder: (context, value, child) {
            return Visibility(
              visible: value > 150,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.orangeAccent,
                        width: 2,
                      )),
                  child: const Icon(
                    Icons.arrow_upward,
                    color: Colors.grey,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
