import 'package:flutter/material.dart';

class FeaturesExample extends StatelessWidget {
  static const String path = '/features_example';
  FeaturesExample({super.key});

  final List<String> screens = [
    'Localization screen',
    'Tab bar screen',
    'carousal',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Available Features',
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile();
        },
      ),
    );
  }
}
