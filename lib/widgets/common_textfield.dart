import 'package:FeatureRichArchFlutter/constants/constants.dart';
import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final String hintText;
  final TextEditingController? controller;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  const CommonTextfield(
      {super.key,
      this.prefixIcon,
      required this.hintText,
      this.controller,
      this.sufixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
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
            controller: controller,
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
