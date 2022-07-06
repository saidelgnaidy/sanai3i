import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanai3i/models/user/user_model.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/shared/theme/helper.dart';

import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/widgets/shared_components.dart';

class KUserTileWidget extends StatelessWidget {
  final double? tileWidth;
  final double? tileHeight;
  final KUser user;
  const KUserTileWidget({Key? key, this.tileWidth, this.tileHeight, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KMainContainer(
      padding: const EdgeInsets.all(5),
      height: tileHeight ?? 75,
      width: (tileWidth ?? Get.width) - (2 * KHelper.hPading),
      child: Row(
        children: [
          if (user.picURL != null)
            CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(user.picURL!),
            )
          else
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/proPic.png'),
            ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Align(
                      alignment: Tr.isAr ? Alignment.centerRight : Alignment.centerLeft,
                      child: Text(
                        user.name!,
                        style: KTextStyle.of(context).body,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(user.available! ? Tr.get.available : Tr.get.unAvailable, style: KTextStyle.of(context).body2),
                      const Spacer(),
                      KIconButton(
                        onPressed: () {
                          debugPrint('**********************  TODO  Show Phone ${user.phone!}');
                        },
                        child: const Icon(KHelper.phone, size: 18),
                      ),
                      const SizedBox(width: 10),
                      KIconButton(
                        onPressed: () {
                          debugPrint('**********************  TODO  Go To Chat ${user.phone!}');
                        },
                        child: const Icon(KHelper.chat, size: 18),
                      ),
                      const SizedBox(width: 10),
                      KIconButton(
                        onPressed: () {
                          debugPrint('**********************  TODO  Add To Faviortes ${user.phone!}');
                        },
                        child: const Icon(KHelper.favorite, size: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
