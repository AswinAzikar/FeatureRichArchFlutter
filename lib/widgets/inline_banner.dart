import 'package:flutter/material.dart';

enum BannerType { info, warning, error, success }

class InlineBanner extends StatelessWidget {
  final String message;
  final VoidCallback? onActionPressed;
  final String? actionLabel;
  final bool dismissible;
  final VoidCallback? onDismissed;
  final BannerType type;

  const InlineBanner({
    Key? key,
    required this.message,
    this.onActionPressed,
    this.actionLabel,
    this.dismissible = false,
    this.onDismissed,
    this.type = BannerType.info,
  }) : super(key: key);

  Color _getBackgroundColor(BuildContext context) {
    switch (type) {
      case BannerType.error:
        return Colors.red.shade100;
      case BannerType.success:
        return Colors.green.shade100;
      case BannerType.warning:
        return Colors.orange.shade100;
      case BannerType.info:
      default:
        return Colors.blue.shade100;
    }
  }

  IconData _getIcon() {
    switch (type) {
      case BannerType.error:
        return Icons.error_outline;
      case BannerType.success:
        return Icons.check_circle_outline;
      case BannerType.warning:
        return Icons.warning_amber_outlined;
      case BannerType.info:
      default:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _getBackgroundColor(context),
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(_getIcon(), size: 20),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
            if (actionLabel != null && onActionPressed != null)
              TextButton(
                onPressed: onActionPressed,
                child: Text(actionLabel!),
              ),
            if (dismissible)
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: onDismissed,
              ),
          ],
        ),
      ),
    );
  }
}
