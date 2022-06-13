import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'hero_dialog.dart';

class KPopupDialg extends StatelessWidget {
  final Widget child;
  final String tag, title;
  final double? height;

  const KPopupDialg({super.key, required this.tag, required this.child, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Hero(
              tag: tag,
              createRectTween: (begin, end) {
                return HeroTween(begin: begin, end: end);
              },
              child: Material(
                elevation: 0,
                color: Colors.transparent,
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(KHelper.btnRadius),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(color: KColors.of(context).rawMatBtn.withOpacity(.5)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: child,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              child: Hero(
                tag: 'title',
                child: Material(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Text(
                    title,
                    style: KTextStyle.of(context).title,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonToDialog extends StatelessWidget {
  final Widget child;
  final String tag;
  final double? dialogHeight;

  const ButtonToDialog({super.key, required this.tag, required this.child, this.dialogHeight});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: tag,
          createRectTween: (begin, end) {
            return HeroTween(begin: begin, end: end);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: Get.width,
              height: 50,
              child: RawMaterialButton(
                fillColor: KColors.of(context).rawMatBtn,
                shape: KHelper.btnShape,
                elevation: 0,
                onPressed: () {
                  Navigator.push(
                    context,
                    HeroDialog(
                      builder: (context) => KPopupDialg(
                        tag: tag,
                        title: Tr.get.login_register,
                        height: dialogHeight,
                        child: child,
                      ),
                      settings: RouteSettings(name: tag),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        IgnorePointer(
          child: Hero(
            tag: 'title',
            child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: Text(
                Tr.get.login_register,
                style: KTextStyle.of(context).rawBtn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
