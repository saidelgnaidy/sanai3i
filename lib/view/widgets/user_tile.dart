import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sanai3i/logic/bookmarks/bookmark_state.dart';
import 'package:sanai3i/logic/bookmarks/bookmarks_bloc.dart';
import 'package:sanai3i/models/user/user_model.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/shared/theme/helper.dart';

import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/chats/chat_view.dart';
import 'package:sanai3i/view/profile/profile_pic.dart';
import 'package:sanai3i/view/widgets/shared_components.dart';

class KUserTileWidget extends StatefulWidget {
  final double? tileWidth;
  final double? tileHeight;
  final KUser user;
  final bool? inBookmarks;
  final Animation<double>? animation;
  const KUserTileWidget({Key? key, this.tileWidth, this.tileHeight, required this.user, this.inBookmarks = false, this.animation}) : super(key: key);

  @override
  State<KUserTileWidget> createState() => _KUserTileWidgetState();
}

class _KUserTileWidgetState extends State<KUserTileWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final List<Widget> contacts_list = [
      KIconButton(
        onPressed: () {
          KHelper.launchCaller(widget.user.phone!);
        },
        child: const Icon(KHelper.phone, size: 18),
      ),
      const SizedBox(width: 10),
      KIconButton(
        onPressed: () {
          Get.to(() => ChatView(user: widget.user));
        },
        child: const Icon(KHelper.chat, size: 18),
      ),
      const SizedBox(width: 10),
      BlocBuilder<BookmarksBloc, BookmarksState>(
        builder: (context, state) {
          return KIconButton(
            onPressed: () {
              BookmarksBloc.of(context).addToBookmark(widget.user);
            },
            child: Icon(KHelper.favorite, size: 18, color: BookmarksBloc.of(context).isBooked(widget.user.uid ?? '') ? Colors.red : null),
          );
        },
      ),
    ];
    var kMainContainer = KMainContainer(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: KHelper.hPading, vertical: KHelper.hPading / 2),
      height: widget.tileHeight ?? 80,
      width: (widget.tileWidth ?? Get.width),
      child: Row(
        children: [
          KProfilePic(
            user: widget.user,
            radius: (widget.tileHeight ?? 80) * .85,
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
                        widget.user.name!,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.user.service != null && widget.inBookmarks!)
                            Text(Tr.isAr ? widget.user.service!.nameAr : widget.user.service!.nameEn, style: KTextStyle.of(context).body2),
                          const Spacer(),
                          Text(widget.user.available! ? Tr.get.available : Tr.get.unAvailable, style: KTextStyle.of(context).body2),
                          const SizedBox(height: 5),
                        ],
                      ),
                      const Spacer(),
                      if (!widget.inBookmarks!) ...contacts_list
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [if (widget.inBookmarks!) ...contacts_list],
          )
        ],
      ),
    );

    return SizeTransition(
      sizeFactor: widget.animation ?? CurvedAnimation(parent: AnimationController(vsync: this), curve: Curves.easeOutCubic),
      child: kMainContainer,
    );
  }
}
