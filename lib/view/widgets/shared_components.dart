import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sanai3i/logic/settings/settings_cubit.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:shimmer/shimmer.dart';

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
  const KIconButton({Key? key, this.onPressed, required this.child, this.radius}) : super(key: key);
  final void Function()? onPressed;
  final Widget child;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius ?? 30,
      height: radius ?? 30,
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
  const KButton({super.key, required this.title, required this.onPressed, this.width, this.isSecondary, this.hieght, this.isRounded = true});

  final String title;
  final Function() onPressed;
  final double? width, hieght;
  final bool? isSecondary, isRounded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width,
      height: hieght ?? 55,
      child: RawMaterialButton(
        onPressed: onPressed,
        fillColor: isSecondary ?? false ? KColors.of(context).rawMatBtn2 : KColors.of(context).rawMatBtn,
        shape: isRounded! ? KHelper.btnShape : const RoundedRectangleBorder(),
        elevation: 0,
        child: Text(
          title,
          style: isSecondary ?? false ? KTextStyle.of(context).title : KTextStyle.of(context).title,
        ),
      ),
    );
  }
}

class KShimmer extends StatelessWidget {
  final double? width, height;
  const KShimmer({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade200,
      child: Container(
        height: height ?? 30,
        width: width ?? 100,
        decoration: KHelper.of(context).shimmerBox,
      ),
    );
  }
}

class KShimmerList extends StatelessWidget {
  final int? length;
  final double? width, height;
  final int? crossAxisCount;
  final double? mainAxisSpacing, crossAxisSpacing;
  final Axis? scrollDirection;
  const KShimmerList(
      {Key? key, this.length, this.width, this.height, this.crossAxisCount, this.mainAxisSpacing, this.crossAxisSpacing, this.scrollDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: crossAxisCount ?? 3,
      mainAxisSpacing: mainAxisSpacing ?? 6,
      scrollDirection: scrollDirection ?? Axis.horizontal,
      crossAxisSpacing: crossAxisSpacing ?? 6,
      padding: const EdgeInsets.symmetric(horizontal: KHelper.hPading, vertical: 5),
      itemCount: length ?? 1,
      itemBuilder: (context, index) {
        return KShimmer(
          width: (width ?? 100) + ((index % 4) * 10),
        );
      },
    );
  }
}
