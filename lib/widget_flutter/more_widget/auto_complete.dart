import 'package:flutter/material.dart';

class AutoCompleteWidget extends StatelessWidget {
  const AutoCompleteWidget({super.key});

  static const List<String> _fruitOptions = <String>[
    'apple',
    'banana',
    'orange',
    'mango',
    'grapes',
    'watermelon',
    'kiwi',
    'strawberry',
    'sugarcane',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AutoComplete widget"),
      ),
      // column widget inside it we have two widgets
      // 1) Text widget 2) Autocomplete widget
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("enter Fruit name:"),

          // Auto complete widget
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue fruitTextEditingValue) {
              // if user is input nothing
              if (fruitTextEditingValue.text == '') {
                return const Iterable<String>.empty();
              }

              // if user is input something the build
              // suggestion based on the user input
              return _fruitOptions.where((String option) {
                return option
                    .contains(fruitTextEditingValue.text.toLowerCase());
              });
            },

            // when user click on the suggested
            // item this function calls
            onSelected: (String value) {
              debugPrint('You just selected $value');
            },
          ),
        ],
      ),
    );
  }
}
