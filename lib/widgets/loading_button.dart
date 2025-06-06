import '/constants/constants.dart';
import '/services/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ButtonType {
  outlined,
  filled;

  BoxBorder? get border {
    switch (this) {
      case ButtonType.outlined:
        return Border.all(color: const Color(0xffC9C9C9), width: 1);
      case ButtonType.filled:
        return null;
    }
  }

  LinearGradient get gradient => CustomColors.buttonGradient;

  Color? get color {
    switch (this) {
      case ButtonType.outlined:
        return Colors.transparent;
      case ButtonType.filled:
        return null;
    }
  }

  Color get textColor {
    switch (this) {
      case ButtonType.outlined:
        return const Color(0xff000000);
      case ButtonType.filled:
        return Colors.white;
    }
  }
}

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.buttonLoading,
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.expanded = true,
    this.textColor,
    this.backgroundColor,
    this.buttonType = ButtonType.filled,
    this.icon,
    this.aspectRatio = 60 / 47, // declared but not used
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  });

  final bool buttonLoading;
  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  final bool expanded;
  final Color? textColor;
  final Color? backgroundColor;
  final ButtonType buttonType;
  final Widget? icon;
  final double aspectRatio;
  final EdgeInsetsGeometry padding;

  // bool get _isWebOrDesktop =>
  //     kIsWeb ||
  //     {
  //       TargetPlatform.windows,
  //       TargetPlatform.linux,
  //       TargetPlatform.macOS,
  //     }.contains(defaultTargetPlatform);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(CustomPadding.paddingXL);
    final effectiveTextColor = textColor ?? buttonType.textColor;

    final Widget content = MouseRegion(
      cursor: enabled && !buttonLoading
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: Container(
        decoration: BoxDecoration(
          border: buttonType.border,
          gradient: backgroundColor != null ? null : buttonType.gradient,
          color: backgroundColor ?? buttonType.color,
          borderRadius: borderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: buttonLoading || !enabled
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    HapticFeedback.lightImpact();
                    onPressed();
                  },
            child: Padding(
              padding: padding,
              child: Center(
                child: buttonLoading
                    ? SizedBox(
                        width: 20.h,
                        height: 20.h,
                        child: const CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (icon != null) ...[icon!, SizedBox(width: 8.h)],
                          Text(
                            text,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontSize: 15.fSize,
                                  color: effectiveTextColor,
                                ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );

    final Widget button = ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48, maxWidth: 300),
      child: content,
    );

    return expanded ? Row(children: [Expanded(child: button)]) : button;
  }
}
