import 'package:FeatureRichArchFlutter/constants/constants.dart';
import 'package:FeatureRichArchFlutter/widgets/carousel_view_widget.dart';
import 'package:flutter/material.dart';

import '../../core/logger.dart';

class CarouselExample extends StatelessWidget {
  const CarouselExample({super.key});

  @override
  Widget build(BuildContext context) {
    logError('CarouselExample build called');
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselViewWidget(
            height: 250,
            autoScroll: true,
            // padding: const EdgeInsets.symmetric(horizontal: 20),
            borderRadius: BorderRadius.circular(16),
            shadow: BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: CustomPadding.padding,
              offset: const Offset(0, 4),
            ),
            items: [
              Image.network('https://picsum.photos/id/1/800/400',
                  fit: BoxFit.cover),
              Image.network('https://picsum.photos/id/2/800/400',
                  fit: BoxFit.cover),
              Image.network('https://picsum.photos/id/3/800/400',
                  fit: BoxFit.cover),
            ],
          )
        ],
      ),
    );
  }
}
