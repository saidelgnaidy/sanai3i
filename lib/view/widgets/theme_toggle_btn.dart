import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:sanai3i/shared/src/settings/settings_cubit.dart';

class ThemeToggleBtn extends StatelessWidget {
  ThemeToggleBtn({Key? key}) : super(key: key);
  final AnimateIconController animateIconController = AnimateIconController();

  @override
  Widget build(BuildContext context) {
    return AnimateIcons(
      startIcon: Theme.of(context).brightness == Brightness.light ? Icons.nights_stay_rounded : Icons.wb_sunny_rounded,
      endIcon: Theme.of(context).brightness == Brightness.light ? Icons.nights_stay_rounded : Icons.wb_sunny_rounded,
      controller: animateIconController,
      size: 22.0,
      onStartIconPress: () {
        SettingsBloc.of(context).updateThemeMode();
        return true;
      },
      onEndIconPress: () {
        SettingsBloc.of(context).updateThemeMode();
        return true;
      },
      duration: const Duration(milliseconds: 300),
      endIconColor: Theme.of(context).iconTheme.color,
      startIconColor: Theme.of(context).iconTheme.color,
      clockwise: false,
    );
  }
}
