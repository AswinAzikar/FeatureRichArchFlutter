import '/constants/constants.dart';
import '/features/authentication_screen/view/auth_page.dart';
import '/gen/assets.gen.dart';
import '/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
            // SvgPicture.asset(Assets.svg.rocket),

            Lottie.asset(
              Assets.lotties.girlInABike,
              // width: 200,
              // height: 200,
              fit: BoxFit.fill,
            ),
            const Text(
              'Welcome to the Landing Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: CustomPadding.paddingLarge),
            const Text(
              'This is a simple landing page for our app. Click the button below to continue.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
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
                Navigator.of(context).pushNamed(AuthPage.path);
              }),
        ),
      ),
    );
  }
}
