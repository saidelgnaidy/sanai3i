import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanai3i/shared/const.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'hero_dialog.dart';

class KPopupDialg extends StatelessWidget {
  final Widget child;
  final String tag, title;

  const KPopupDialg({super.key, required this.tag, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
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
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(KHelper.btnRadius),
                  child: child,
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
                  style: KTextStyle.of(context).reTitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonToDialog extends StatelessWidget {
  final Widget dialog;
  final String tag, title;

  const ButtonToDialog({super.key, required this.tag, required this.dialog, required this.title});

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
          child: SizedBox(
            width: Get.width,
            height: 50,
            child: KButton(
              title: '',
              onPressed: () {
                Navigator.push(
                  context,
                  HeroDialog(
                    builder: (context) => KPopupDialg(
                      tag: tag,
                      title: title,
                      child: dialog,
                    ),
                    settings: RouteSettings(name: tag),
                  ),
                );
              },
            ),
          ),
        ),
        IgnorePointer(
          child: Hero(
            tag: 'title',
            child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: Text(title, style: KTextStyle.of(context).rawBtn),
            ),
          ),
        ),
      ],
    );
  }
}

class KIconToDialog extends StatelessWidget {
  final Widget dialog;
  final String tag, title;
  final double? dialogHeight;

  const KIconToDialog({super.key, required this.tag, required this.dialog, this.dialogHeight, required this.title});

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
              builder: (context) => KPopupDialg(
                tag: tag,
                title: title,
                child: dialog,
              ),
              settings: RouteSettings(name: tag),
            ),
          );
        },
      ),
    );
  }
}
