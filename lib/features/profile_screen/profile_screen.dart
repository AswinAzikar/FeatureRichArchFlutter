import '/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/not_found_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NotFoundWidget(),
        ],
      ),
    );
  }
}
