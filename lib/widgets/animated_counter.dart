import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  final num value;
  final Duration duration;
  final TextStyle? textStyle;
  final String prefixText;
  final String suffixText;
  final int decimalPlaces;

  const AnimatedCounter({
    super.key,
    required this.value,
    this.duration = const Duration(milliseconds: 800),
    this.textStyle,
    this.prefixText = '',
    this.suffixText = '',
    this.decimalPlaces = 0,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<num>(
      tween: Tween<num>(begin: 0, end: value),
      duration: duration,
      builder: (context, val, child) {
        String formattedValue = val.toStringAsFixed(decimalPlaces);
        return Text(
          '$prefixText$formattedValue$suffixText',
          style: textStyle ?? Theme.of(context).textTheme.headlineMedium,
        );
      },
    );
  }
}
