import 'package:FeatureRichArchFlutter/constants/constants.dart';
import 'package:FeatureRichArchFlutter/features/home_screen/view/home_screen.dart';
import 'package:FeatureRichArchFlutter/widgets/loading_button.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  static const String path = '/landing';
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(CustomPadding.paddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,/
          children: [
            Text('Landing Page'),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: CustomPadding.padding),
        child: SafeArea(
          child: LoadingButton(
              buttonLoading: false,
              text: 'lets go !',
              onPressed: () {
                Navigator.of(context).pushNamed(HomeScreen.path);
              }),
        ),
      ),
    );
  }
}
