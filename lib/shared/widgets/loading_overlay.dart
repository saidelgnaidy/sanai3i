import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/shared/theme/colors.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const LoadingOverlay({Key? key, required this.child, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        if (isLoading)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            child: Container(
              decoration: BoxDecoration(
                color: KColors.of(context).rawMatBtn.withOpacity(0),
              ),
              child: Lottie.asset(
                'assets/animations/${Theme.of(context).brightness == Brightness.dark ? "loadD" : "loadL"}.json',
                width: 150,
                height: 150,
                frameRate: FrameRate(120),
              ),
            ),
          ),
      ],
    );
  }
}
