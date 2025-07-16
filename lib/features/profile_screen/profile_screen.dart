import 'package:FeatureRichArchFlutter/core/logger.dart';

import 'package:flutter/material.dart';

import '../../extensions/app_theme_extensions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    logError("⚠️ ProfileScreen build called");
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
        children: [],
      ),
    );
  }
}
