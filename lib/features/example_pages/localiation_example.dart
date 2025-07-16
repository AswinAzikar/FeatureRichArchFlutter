import 'package:FeatureRichArchFlutter/core/logger.dart';
import 'package:FeatureRichArchFlutter/extensions/app_theme_extensions.dart';
import 'package:FeatureRichArchFlutter/main.dart';
import 'package:FeatureRichArchFlutter/widgets/mini_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LocaliationExample extends StatefulWidget {
  const LocaliationExample({super.key});

  @override
  State<LocaliationExample> createState() => _LocaliationExample();
}

class _LocaliationExample extends State<LocaliationExample> {
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
        children: [
          Text(localizationService.translate('hello')),
          const Gap(20),
          MiniLoadingButton(
              text: 'Malayalam',
              onPressed: () {
                setState(() {
                  MyApp.setLanguage('ml');
                });

                // setState(() {});
              }),
          const Gap(20),
          MiniLoadingButton(
              text: 'English',
              onPressed: () {
                setState(() {
                  MyApp.setLanguage('en');
                });

                // setState(() {});
              })
        ],
      ),
    );
  }
}
