import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final bool labelOnLeft;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;

  const LabeledCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.labelOnLeft = false,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labelWidget =
        Text(label, style: textStyle ?? Theme.of(context).textTheme.bodyMedium);
    final checkboxWidget = Checkbox(value: value, onChanged: onChanged);

    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: labelOnLeft
              ? [labelWidget, const SizedBox(width: 8), checkboxWidget]
              : [checkboxWidget, const SizedBox(width: 8), labelWidget],
        ),
      ),
    );
  }
}
