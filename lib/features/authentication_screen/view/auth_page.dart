import 'package:FeatureRichArchFlutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  static const String path = '/authpage';

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.png.authbg.path), fit: BoxFit.cover)),
      ),
    );
  }
}
