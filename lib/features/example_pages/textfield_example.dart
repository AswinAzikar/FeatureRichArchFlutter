import '/widgets/common_textfield.dart';
import 'package:flutter/material.dart';

import '../../extensions/app_theme_extensions.dart';

class TextfieldExample extends StatelessWidget {
  const TextfieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).extension<AppThemeColors>()!;

    return Scaffold(
      appBar: AppBar(
          title: Text("Tab Template",
              style: TextStyle(color: appColor.textContrastColor))),
      body: Center(child: CommonTextfield(hintText: 'Search')),
    );
  }
}
