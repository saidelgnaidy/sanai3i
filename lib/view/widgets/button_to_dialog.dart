import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanai3i/view/widgets/shared_components.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'hero_dialog.dart';

class KPopupDialg extends StatelessWidget {
  final Widget child;
  final String tag;

  const KPopupDialg({super.key, required this.child, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: Get.width,
          height: Get.height,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
            child: IgnorePointer(child: Container(color: Colors.transparent)),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KHelper.hPading),
              child: Hero(
                tag: tag,
                createRectTween: (begin, end) => HeroTween(begin: begin, end: end),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(KHelper.btnRadius),
                  child: Material(
                    elevation: 0,
                    color: KColors.of(context).rawMatBtn,
                    child: FittedBox(child: child),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class KButtonToDialog extends StatelessWidget {
  final Widget dialog;
  final String title;
  final String? tag;
  final bool? isDismissible;

  const KButtonToDialog({super.key, required this.dialog, required this.title, this.isDismissible, this.tag});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 50,
      child: Hero(
        tag: tag ?? title,
        createRectTween: (begin, end) {
          return HeroTween(begin: begin, end: end);
        },
        child: KButton(
          title: title,
          onPressed: () {
            Navigator.push(
              context,
              HeroDialog(
                builder: (context) => KPopupDialg(tag: tag ?? title, child: dialog),
                isDismissible: isDismissible,
              ),
            );
          },
        ),
      ),
    );
  }
}

class KIconToDialog extends StatelessWidget {
  final Widget dialog;
  final String tag;

  const KIconToDialog({
    super.key,
    required this.tag,
    required this.dialog,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      createRectTween: (begin, end) {
        return HeroTween(begin: begin, end: end);
      },
      child: KIconButton(
        child: const Icon(KHelper.qrCode),
        onPressed: () {
          Navigator.push(
            context,
            HeroDialog(
              builder: (context) => KPopupDialg(tag: tag, child: dialog),
            ),
          );
        },
      ),
    );
  }
}
