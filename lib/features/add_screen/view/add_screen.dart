import '/features/tabbar_example/tabbar_example.dart';
import '/widgets/mini_loading_button.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MiniLoadingButton(
          text: 'View Tabbar',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SampleTabPage(),
            ));
          },
        ),
      ),
    );
  }
}
