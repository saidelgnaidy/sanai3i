import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/shared/theme/helper.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading, reverseTheme;
  const LoadingOverlay({Key? key, required this.child, this.isLoading = false, this.reverseTheme = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        if (isLoading)
          Positioned(
            top: 0,
            width: Get.width,
            height: Get.height,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(KHelper.btnRadius),
                ),
              ),
            ),
          ),
        if (isLoading)
          Positioned(
            child: Lottie.asset(
              'assets/animations/${Theme.of(context).brightness == (reverseTheme ? Brightness.dark : Brightness.light) ? "loadD" : "loadL"}.json',
              width: 150,
              height: 150,
              frameRate: FrameRate(90),
            ),
          )
      ],
    );
  }
}
