import 'package:flutter/material.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';

class KTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? hintText, errorText;
  final bool autofocus;
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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        autofocus: autofocus,
        style: KTextStyle.of(context).title,
        textAlign: TextAlign.center,
        cursorColor: KColors.of(context).reCursor,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: KTextStyle.of(context).hint,
          errorStyle: KTextStyle.of(context).error,
          errorText: errorText,
        ),
      ),
    );
  }
}
