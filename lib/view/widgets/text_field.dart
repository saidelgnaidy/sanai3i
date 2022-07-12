import 'package:flutter/material.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';

class KTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon, prefixIcon;
  final String? hintText, errorText;
  final bool autofocus, enabled;
  const KTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.hintText,
    this.errorText,
    this.keyboardType,
    this.onChanged,
    this.autofocus = false,
    this.prefixIcon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        keyboardAppearance: Theme.of(context).brightness,
        textAlignVertical: TextAlignVertical.bottom,
        keyboardType: keyboardType,
        controller: controller,
        autofocus: autofocus,
        enabled: enabled,
        textAlign: TextAlign.center,
        cursorColor: KColors.of(context).reCursor,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: KTextStyle.of(context).hint,
          errorStyle: KTextStyle.of(context).error,
          errorText: errorText,
          suffixIcon: suffixIcon == null ? null : SizedBox(width: 65, child: suffixIcon),
          prefixIcon: prefixIcon == null ? null : SizedBox(width: 75, child: prefixIcon),
        ),
      ),
    );
  }
}
