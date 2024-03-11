import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValueListenableBuilderExample extends StatefulWidget {
  const ValueListenableBuilderExample({super.key});

  @override
  State<ValueListenableBuilderExample> createState() =>
      _ValueListenableBuilderExampleState();
}

class _ValueListenableBuilderExampleState
    extends State<ValueListenableBuilderExample> {
  late final ValueNotifier<double> _scrollValue;
  late final ScrollController _scrollController;
  double height = 150.0;

  void addListener() {
    _scrollValue.value = _scrollController.offset;
  }

  @override
  void initState() {
    super.initState();
    _scrollValue = ValueNotifier<double>(0.0);
    _scrollController = ScrollController()..addListener(addListener);
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
              expandedHeight: height,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/fruit1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              actions: [
                ValueListenableBuilder(
                    valueListenable: _scrollValue,
                    builder: (_, value, __) {
                      return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: AnimatedCrossFade(
                              firstChild: const Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.white,
                              ),
                              secondChild: const Icon(
                                Icons.document_scanner_sharp,
                                size: 30,
                                color: Colors.white,
                              ),
                              crossFadeState: value >= height
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: const Duration(milliseconds: 200)));
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
                      color: Colors.orangeAccent,
                      width: 1.0,
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
        builder: (_, value, child) {
          return AnimatedOpacity(
            opacity: value > height ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: child,
          );
        },
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
  }
}
