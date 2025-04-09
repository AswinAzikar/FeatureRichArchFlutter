
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get adaptiveTextColor => Theme.of(this).brightness == Brightness.dark
      ? Colors.white
      : Colors.black;

  TextStyle baseTextStyle(String fontFamily, FontWeight fontWeight) {
    return TextStyle(
      decoration: TextDecoration.none,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: adaptiveTextColor,
    );
  }
  
  //   TextStyle get latoRegular => baseTextStyle('Lato', FontWeight.w400);
  // TextStyle get latoBold => baseTextStyle('Lato', FontWeight.w700);
  // TextStyle get latoBlack => baseTextStyle('Lato', FontWeight.w900);
  // TextStyle get latoLight => baseTextStyle('Lato', FontWeight.w300);
  // TextStyle get latoThin => baseTextStyle('Lato', FontWeight.w100);
  
  
  
  }
