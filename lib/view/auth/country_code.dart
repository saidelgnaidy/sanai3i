import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';

class CountryCodeWidget extends StatelessWidget {
  final void Function(CountryCode?)? onChanged, onInit;
  const CountryCodeWidget({Key? key, this.onChanged, this.onInit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: onChanged,
      showFlag: false,
      barrierColor: KColors.of(context).background,
      hideSearch: true,
      textStyle: KTextStyle.of(context).reTitle,
      dialogTextStyle: KTextStyle.of(context).body,
      initialSelection: 'EG',
      favorite: const ['SA', 'EG', 'AE', 'SY', 'OM', 'MC', 'KW', 'JO', 'IR', 'IQ', 'PS', 'QA', 'BH', 'YE', 'TN', 'DZ', 'LB', 'LY'],
      showFlagDialog: true,
      closeIcon: Icon(Icons.close, color: KColors.of(context).icon),
      dialogBackgroundColor: KColors.of(context).codePicker,
      comparator: (a, b) => b.name!.compareTo(a.name!),
      onInit: onInit,
    );
  }
}
