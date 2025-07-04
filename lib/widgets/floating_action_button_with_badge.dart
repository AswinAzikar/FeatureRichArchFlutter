import 'package:flutter/material.dart';

class FloatingActionButtonWithBadge extends StatelessWidget {
  final int badgeCount;
  final Function onPressed;
  final IconData icon;
  final Color badgeColor;

  const FloatingActionButtonWithBadge({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.badgeCount = 0,
    this.badgeColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        FloatingActionButton(
          onPressed: () => onPressed(),
          child: Icon(icon),
        ),
        if (badgeCount > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Text(
                badgeCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
