import 'package:flutter/material.dart';

@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color primary;
  final Color background;
  final Color textDark;
  final Color textGrey;
  final Color textLightGrey;

  const AppThemeColors({
    required this.primary,
    required this.background,
    required this.textDark,
    required this.textGrey,
    required this.textLightGrey,
  });

  @override
  AppThemeColors copyWith({
    Color? primary,
    Color? background,
    Color? textDark,
    Color? textGrey,
    Color? textLightGrey,
  }) {
    return AppThemeColors(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      textDark: textDark ?? this.textDark,
      textGrey: textGrey ?? this.textGrey,
      textLightGrey: textLightGrey ?? this.textLightGrey,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) return this;
    return AppThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
      textDark: Color.lerp(textDark, other.textDark, t)!,
      textGrey: Color.lerp(textGrey, other.textGrey, t)!,
      textLightGrey: Color.lerp(textLightGrey, other.textLightGrey, t)!,
    );
  }
}
