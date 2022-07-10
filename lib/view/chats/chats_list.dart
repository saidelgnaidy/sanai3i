import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanai3i/logic/user_info/user_info_bloc.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/view/chats/chat_view.dart';
import 'package:sanai3i/view/profile/profile_pic.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          color: KColors.of(context).elevatedBox,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => Get.to(() => const ChatView()),
            leading: KProfilePic(user: UserInfoBloc.of(context).user!, radius: 60),
            title: Text(UserInfoBloc.of(context).user!.name!),
            subtitle: const Text('last message'),
          ),
        ),
      ],
    );
  }
}
