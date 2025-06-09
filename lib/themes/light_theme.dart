import 'package:FeatureRichArchFlutter/constants/constants.dart';
import 'package:FeatureRichArchFlutter/exporter/exporter.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true, scaffoldBackgroundColor: CustomColors.backgroundColor,

  inputDecorationTheme: InputDecorationTheme(
    // border: InputBorder.none,

    hintStyle: TextStyle(



      color: CustomColors.textColorGrey,
      fontWeight: FontWeight.w500,
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: CustomPadding.paddingLarge,
      vertical: 12.v,
    ),

    // filled: true,
    // fillColor: CustomColors.textfieldphoneColors,
    border: OutlineInputBorder(


      borderRadius: BorderRadius.circular(CustomPadding.paddingLarge),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 1.0,
      ),
    ),
    // contentPadding: EdgeInsets.symmetric(
    //     horizontal: CustomPadding.paddingLarge,
    //     vertical: CustomPadding.padding),
    // hintStyle: TextStyle(
    //     color: CustomColors.textColorGrey, fontWeight: FontWeight.w500),
  ),
  // colorScheme: ColorScheme.fromSeed(
  //   seedColor: Colors.deepPurple,
  //   primary: Colors.deepPurple,
  //   secondary: Colors.purpleAccent,
  //   surface: Colors.white,
  //   background: Colors.white,
  //   onPrimary: Colors.white,
  //   onSecondary: Colors.black87,
  //   onSurface: Colors.black87,
  //   onBackground: Colors.black87,
  // ),
  // appBarTheme: AppBarTheme(
  //   backgroundColor: Colors.deepPurple,
  //   foregroundColor: Colors.white,
  // ),
  // textTheme: TextTheme(
  //   bodyText1: TextStyle(color: Colors.black87),
  //   bodyText2: TextStyle(color: Colors.black54),
  // ),
);
