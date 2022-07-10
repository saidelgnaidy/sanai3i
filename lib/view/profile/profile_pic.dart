import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sanai3i/models/user/user_model.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';

class KProfilePic extends StatelessWidget {
  final double? radius;
  final KUser user;
  const KProfilePic({Key? key, this.radius = KHelper.profilePicWidth, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius!,
      height: radius!,
      decoration: KHelper.of(context).elevatedCircle,
      child: FittedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius!),
          child: CircleAvatar(
            maxRadius: radius! / 2,
            backgroundColor: KColors.of(context).elevatedBox,
            backgroundImage: user.picURL != null ? CachedNetworkImageProvider(user.picURL!) : const AssetImage('assets/proPic.png') as ImageProvider,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: KColors.of(context).elevatedBox,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: [
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.star, size: 14, color: Colors.amber),
                      ),
                      const SizedBox(width: 3),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text((user.rate ?? '0.0').toString(), style: KTextStyle.of(context).body2),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
