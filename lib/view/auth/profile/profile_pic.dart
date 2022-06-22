import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';

class KProfilePic extends StatelessWidget {
  final bool? showRate;
  const KProfilePic({Key? key, this.showRate = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KHelper.of(context).elevatedCircle,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(KHelper.profilePicRadius),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: KHelper.profilePicWidth,
              height: KHelper.profilePicWidth,
              child: Lottie.asset('assets/animations/working.json'),
            ),
            if (showRate!)
              Positioned(
                bottom: 0,
                child: Container(
                  width: KHelper.profilePicWidth + 20,
                  height: 18,
                  color: KColors.of(context).background,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: [
                      const Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.star, size: 14, color: Colors.amber),
                        ),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text('4.9', style: KTextStyle.of(context).body3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
