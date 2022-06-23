import 'package:flutter/material.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';

class KIconedText extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? traling;
  const KIconedText({super.key, required this.title, required this.icon, this.traling});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KHelper.of(context).outlined,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 45,
            height: 45,
            child: Icon(icon, color: KColors.of(context).inactiveIcons),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: KTextStyle.of(context).body,
                ),
              ),
            ),
          ),
          SizedBox(width: 45, height: 45, child: traling)
        ],
      ),
    );
  }
}
