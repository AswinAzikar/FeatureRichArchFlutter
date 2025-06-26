import 'package:FeatureRichArchFlutter/core/logger.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';

class RatingStar extends StatelessWidget {
  final int maxRating;
  final double initailRating;
  const RatingStar(
      {super.key, required this.maxRating, required this.initailRating});

  @override
  Widget build(BuildContext context) {
    // return RatingBar.readOnly(
    return RatingBar(
      isHalfAllowed: true,
      halfFilledIcon: Icons.star,
      filledIcon: Icons.star,
      emptyIcon: Icons.star_border,
      onRatingChanged: (value) {
        Gaimon.medium();

        logInfo("Tapped stars: $value");
      },
      initialRating: initailRating,
      maxRating: maxRating,
    );
  }
}
