import 'package:FeatureRichArchFlutter/constants/constants.dart';
import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CustomPadding.paddingLarge),
      child: Material(
          elevation: 1,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: TextFormField(
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
              prefixIcon: Icon(
                prefixIcon,
                color: CustomColors.textColorGrey,
              ),
              suffixIcon: Icon(sufixIcon),
              hintText: hintText,
            ),
          )),
    );
  }
}
