import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../extensions/app_theme_extensions.dart';
import '../../widgets/not_found_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppThemeColors>()!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.background,
        title: Text(
          'Profile',
          style: TextStyle(color: appColors.textContrastColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // NotFoundWidget(),
        ],
      ),
    );
  }
}
