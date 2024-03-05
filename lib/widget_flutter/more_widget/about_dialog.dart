import 'package:flutter/material.dart';

class AboutDialogWidget extends StatelessWidget {
  const AboutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const AboutDialog(
                applicationName: 'Flutter App',
                applicationIcon: FlutterLogo(),
                applicationLegalese: 'Legales',
                applicationVersion: 'Version',
                children: [
                  Text('This is a text'),
                ],
              ),
            );
          },
          child: const Text('Show About Dialog')),
    );
  }
}
