import 'package:FeatureRichArchFlutter/features/example_pages/textfield_example.dart';
import 'package:FeatureRichArchFlutter/features/home_screen/paginated_home_screen.dart';
import 'package:FeatureRichArchFlutter/widgets/common_textfield.dart';
import 'package:FeatureRichArchFlutter/widgets/upload_image_widget.dart';

import '../paginated_home_screen/view/paginated_homescreen.dart';
import '/exporter/exporter.dart';
import '/extensions/app_theme_extensions.dart';
import '/features/animated_grid_screen/animated_grid_screen.dart';
import '/features/example_pages/carousel_example.dart';
import '/features/example_pages/localiation_example.dart';
import '/features/example_pages/mini_loading_example.dart';
import '/features/example_pages/sample_modal_example.dart';
import '/features/example_pages/tabbar_example.dart';
import '/widgets/mini_loading_button.dart';
import '/widgets/not_found_widget.dart';
import '/widgets/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeaturesExample extends StatelessWidget {
  static const String path = '/features_example';
  FeaturesExample({super.key});

  final List<String> screens = [
    'Localization screen',
    'Tab bar screen',
    'Custom Carousal',
    'Grid View',
    'Bottom Modal',
    'loading Buttons',
    'Not Found Screen',
    'Star Rating',
    'TextField',
  ];

  final List<Widget> screenRoutes = [
    LocaliationExample(),
    SampleTabPage(),
    CarouselExample(),
    AnimatedGridScreen(),
    SampleModalExample(),
    MiniLoadingExample(),
    NotFoundWidget(),
    RatingStar(maxRating: 5, initailRating: 2),
    TextfieldExample(),
    
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppThemeColors>()!;

    return Scaffold(
      floatingActionButton: Text(
        "Widgets Count : ${screens.length} ",
        style:
            context.headlineSmall.copyWith(color: appColors.dynamicIconColor),
      ),
      appBar: AppBar(
        // actions: [],
        title: Padding(
          padding: EdgeInsets.only(right: CustomPadding.paddingLarge.h),
          child: Text(
            'Available Features',
            style: context.headlineMedium
                .copyWith(color: appColors.dynamicIconColor),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: screens.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(CustomPadding.paddingLarge),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(CustomPadding.padding),
                  color: appColors.dynamicIconColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 1,
                      color: Colors.grey,
                    ),
                  ]),
              child: ListTile(
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => screenRoutes[index],
                        ));
                  },
                  title: Center(
                    child: Text(
                      screens[index],
                      style: context.headlineLarge.copyWith(
                          letterSpacing: 2, color: appColors.background),
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
