// import '../ants/ants.dart';
import '../constants/constants.dart';
import '../services/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extensions/app_theme_extensions.dart';

final lightTheme = ThemeData(
  splashFactory: NoSplash.splashFactory,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFFF5F5F5),
  useMaterial3: true,
  extensions: [
    AppThemeColors(
      dynamicIconColor: Colors.black,
      primary: CustomColors.primaryColor,
      background: CustomColors.backgroundColor,
      textContrastColor: Colors.black87,
      textGrey: Colors.grey,
      textLightGrey: CustomColors.textColorLightGrey,
    ),
  ],
  navigationBarTheme: NavigationBarThemeData(
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(CustomPadding.paddingLarge),
    ),
    height: kBottomNavigationBarHeight,
    backgroundColor: Color(0xFFF5F5F5),
    indicatorColor: Color(0xFF3AB54A),
    labelTextStyle: WidgetStatePropertyAll(
      TextStyle(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: WidgetStatePropertyAll(
      IconThemeData(
        color: Color(0xFF3AB54A),
        size: 24.v,
      ),
    ),
  ),
  dividerTheme: DividerThemeData(
    thickness: 0.7,
    color: Color(0xFFD3D3D3),
    endIndent: 40,
    indent: 40,
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Color(0xFFF5F5F5)),
    backgroundColor: Color(0xFFF5F5F5),
    foregroundColor: Colors.black87,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black87,
      fontSize: 18.fSize,
      fontWeight: FontWeight.w500,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w500,
      
    ),
    // contentPadding:  EdgeInsets.symmetric(
    //   horizontal: 16,
    //   vertical: 12,
    // ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(CustomPadding.paddingLarge),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 1.0,
      ),
    ),
  ),
);
