import 'dart:math';
import 'package:flutter/material.dart';

class RadialContextMenu extends StatelessWidget {
  final Offset center;
  final double radius;
  final List<IconData> icons;
  final void Function(int) onSelected;

  const RadialContextMenu({
    super.key,
    required this.center,
    required this.radius,
    required this.icons,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(icons.length, (index) {
        final angle = (2 * pi / icons.length) * index;
        final x = center.dx + radius * cos(angle);
        final y = center.dy + radius * sin(angle);

        return Positioned(
          left: x - 24,
          top: y - 24,
          child: GestureDetector(
            onTap: () => onSelected(index),
            child: CircleAvatar(
              backgroundColor: Colors.black87,
              child: Icon(icons[index], color: Colors.white),
            ),
          ),
        );
      }),
    );
  }
}
