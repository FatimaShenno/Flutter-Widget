import 'package:flutter/material.dart';

class NotificatonListenerWidget extends StatefulWidget {
  const NotificatonListenerWidget({super.key});

  @override
  State<NotificatonListenerWidget> createState() =>
      _NotificatonListenerWidgetState();
}

class _NotificatonListenerWidgetState extends State<NotificatonListenerWidget> {
  String message = 'new';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            color: Colors.amber,
            child: Center(
              child: Text(message),
            ),
          ),
          Expanded(
              child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {
                setState(() {
                  message = 'Scroll Started';
                });
              } else if (notification is ScrollUpdateNotification) {
                setState(() {
                  message = 'Scroll Updeted';
                });
              } else if (notification is ScrollEndNotification) {
                setState(() {
                  message = 'Scroll Ended';
                });
              }
              return true;
            },
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
