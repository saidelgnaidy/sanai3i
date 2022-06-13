import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/src/settings/settings_cubit.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';

showSnackBar(String msg) {
  Get.closeAllSnackbars();
  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.TOP,
    barBlur: 10.0,
    backgroundColor: Colors.black.withOpacity(.6),
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    duration: const Duration(seconds: 3),
    padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 8),
    forwardAnimationCurve: Curves.decelerate,
    reverseAnimationCurve: Curves.decelerate,
    dismissDirection: DismissDirection.horizontal,
    colorText: Colors.white,
    messageText: Text(
      msg,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
    ),
  );
}

class LangSwitch extends StatelessWidget {
  const LangSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: SettingsBloc.of(context).updateLocale,
      icon: Text(
        SettingsBloc.of(context).locale == const Locale('ar') ? Tr.get.en : Tr.get.ar,
        style: KTextStyle.of(context).langSwitch,
      ),
    );
  }
}

class KIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;

  const KIconButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: KColors.of(context).icon),
    );
  }
}

class KButton extends StatelessWidget {
  const KButton({super.key, required this.title, required this.onPressed, this.width});

  final String title;
  final Function() onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: width ?? Get.width,
        height: 50,
        child: RawMaterialButton(
          onPressed: onPressed,
          fillColor: KColors.of(context).rawMatBtn,
          shape: KHelper.btnShape,
          elevation: 0,
          child: Text(
            title,
            style: KTextStyle.of(context).title,
          ),
        ),
      ),
    );
  }
}
