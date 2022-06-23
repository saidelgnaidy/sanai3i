import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/src/settings/settings_cubit.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';



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
  const KIconButton({
    Key? key,
    this.onPressed, required this.child,
  }) : super(key: key);
  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: const StadiumBorder(),
        child: child,
      ),
    );
  }
}

class KMainContainer extends StatelessWidget {
  final Widget? child;
  final double? height, width;
  final EdgeInsetsGeometry? margin, padding;

  const KMainContainer({super.key, this.height, this.width, this.margin, this.padding, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KHelper.of(context).elevatedBox,
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      child: child,
    );
  }
}

class KButton extends StatelessWidget {
  const KButton({super.key, required this.title, required this.onPressed, this.width, this.isSecondary});

  final String title;
  final Function() onPressed;
  final double? width;
  final bool? isSecondary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: width ?? Get.width,
        height: 50,
        child: RawMaterialButton(
          onPressed: onPressed,
          fillColor: isSecondary ?? false ? KColors.of(context).rawMatBtn2 : KColors.of(context).rawMatBtn,
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
