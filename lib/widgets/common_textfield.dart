import 'package:FeatureRichArchFlutter/constants/constants.dart';
import 'package:FeatureRichArchFlutter/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';

class CommonTextfield extends StatefulWidget {
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final String hintText;
  final TextEditingController? controller;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? customValidator;
  final bool isRequired;
  const CommonTextfield({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.controller,
    this.sufixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.customValidator,
    this.isRequired = false,
  });

  @override
  State<CommonTextfield> createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {
  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppThemeColors>()!;
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CustomPadding.paddingLarge),
      child: Material(
          borderRadius:
              BorderRadius.all(Radius.circular(CustomPadding.paddingXL)),
          elevation: 1,
          shadowColor: appColors.dynamicIconColor,
          child: TextFormField(
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            controller: widget.controller,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            minLines: widget.obscureText ? 1 : widget.minLines,
            onChanged: widget.onChanged,
            validator: (value) {
              if (widget.isRequired &&
                  (value == null || value.trim().isEmpty)) {
                return 'This field is required';
              }
              if (widget.customValidator != null) {
                return widget.customValidator!(value);
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: appColors.dynamicIconColor.withValues(alpha: 0.5),
              prefixIcon: Icon(
                widget.prefixIcon,
                color: appColors.background..withValues(alpha: 0.5),
              ),
              suffixIcon: Icon(widget.sufixIcon,
                  color: appColors.background.withValues(alpha: 0.5)),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: appColors.background.withValues(alpha: 0.5),
                fontWeight: FontWeight.w500,
              ),
            ),
          )),
    );
  }
}
