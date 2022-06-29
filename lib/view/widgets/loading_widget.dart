import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class KLoadingWidget extends StatelessWidget {
  final bool reverseTheme;
  const KLoadingWidget({Key? key, this.reverseTheme = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        height: Get.height * .8,
        width: Get.width,
        child: Center(
          child: Lottie.asset(
            'assets/animations/${Theme.of(context).brightness == (reverseTheme ? Brightness.dark : Brightness.light) ? "loadD" : "loadL"}.json',
            width: 150,
            height: 150,
            frameRate: FrameRate(90),
          ),
        ),
      ),
    );
  }
}
