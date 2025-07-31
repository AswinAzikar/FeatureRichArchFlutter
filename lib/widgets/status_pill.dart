import 'package:flutter/material.dart';

enum StatusType { success, warning, error, info, custom }

class StatusPill extends StatelessWidget {
  final String label;
  final StatusType type;
  final Color? customColor;
  final TextStyle? textStyle;

  const StatusPill({
    Key? key,
    required this.label,
    this.type = StatusType.info,
    this.customColor,
    this.textStyle,
  }) : super(key: key);

  Color _getColor(BuildContext context) {
    switch (type) {
      case StatusType.success:
        return Colors.green.shade600;
      case StatusType.warning:
        return Colors.orange.shade700;
      case StatusType.error:
        return Colors.red.shade600;
      case StatusType.info:
        return Colors.blue.shade600;
      case StatusType.custom:
        return customColor ?? Theme.of(context).primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = _getColor(context).withOpacity(0.15);
    final textColor = _getColor(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: textStyle ??
            TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
      ),
    );
  }
}
