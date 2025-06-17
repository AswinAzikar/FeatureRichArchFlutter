import 'package:FeatureRichArchFlutter/constants/constants.dart';
import 'package:FeatureRichArchFlutter/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? customValidator;
  final bool isRequired;
  final bool autofocus;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
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
    this.autofocus = false,
    this.readOnly = false,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
  });

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
            autofocus: autofocus,
            readOnly: readOnly,
            focusNode: focusNode,
            textInputAction: textInputAction,
            onTapOutside: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onFieldSubmitted: onFieldSubmitted,
            keyboardType: keyboardType,
            obscureText: obscureText,
            controller: controller,
            maxLines: obscureText ? 1 : maxLines,
            minLines: obscureText ? 1 : minLines,
            onChanged: onChanged,
            validator: (value) {
              if (isRequired && (value == null || value.trim().isEmpty)) {
                return 'This field is required';
              }
              if (customValidator != null) {
                return customValidator!(value);
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: appColors.dynamicIconColor.withValues(alpha: 0.5),
              prefixIcon: Icon(
                prefixIcon,
                color: appColors.background..withValues(alpha: 0.5),
              ),
              suffixIcon: Icon(sufixIcon,
                  color: appColors.background.withValues(alpha: 0.5)),
              hintText: hintText,
              hintStyle: TextStyle(
                color: appColors.background.withValues(alpha: 0.5),
                fontWeight: FontWeight.w500,
              ),
            ),
          )),
    );
  }
}
