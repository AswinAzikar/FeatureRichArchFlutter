import 'package:FeatureRichArchFlutter/services/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'light_theme.dart';
import '../constants/constants.dart';

final ThemeData darkTheme = lightTheme.copyWith(
   brightness: Brightness.dark,
   useMaterial3: true,
  scaffoldBackgroundColor: Colors.black,
  navigationBarTheme: lightTheme.navigationBarTheme.copyWith(
    backgroundColor: Colors.black,
    labelTextStyle: WidgetStatePropertyAll(
      TextStyle(
        color: CustomColors.textColorDark,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: WidgetStatePropertyAll(
      IconThemeData(
        color: CustomColors.primaryColor,
        size: 24.v,
      ),
    ),
  ),
  dividerTheme: lightTheme.dividerTheme.copyWith(
    color: CustomColors.textColorDarkGrey.withValues(alpha: 0.3),
  ),
  appBarTheme: lightTheme.appBarTheme.copyWith(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: CustomColors.textColorDark,
      fontSize: 18.fSize,
      fontWeight: FontWeight.w500,
    ),
  ),
  inputDecorationTheme: lightTheme.inputDecorationTheme.copyWith(
    hintStyle: TextStyle(
      color: CustomColors.textColorGrey,
      fontWeight: FontWeight.w500,
    ),
    // contentPadding: EdgeInsets.symmetric(
    //   horizontal: CustomPadding.paddingLarge,
    //   vertical: 12.v,
    // ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(CustomPadding.paddingLarge),
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 1.0,
      ),
    ),
  ),
);
