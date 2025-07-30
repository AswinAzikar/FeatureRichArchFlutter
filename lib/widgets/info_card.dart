import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final double elevation;

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.iconColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.onTap,
    this.elevation = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: backgroundColor,
      elevation: elevation,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: iconColor.withOpacity(0.1),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      // style: theme.textTheme.caption
                      //     ?.copyWith(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      // style: theme.textTheme.headline6
                      //     ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              if (onTap != null)
                const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
