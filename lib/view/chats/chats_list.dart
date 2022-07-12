import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanai3i/logic/chat/chats_bloc.dart';
import 'package:sanai3i/logic/user_info/user_info_bloc.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/view/chats/chat_view.dart';
import 'package:sanai3i/view/profile/profile_pic.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ChatBloc.of(context).conversationsListStream,
      builder: (context, snapshot) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: KHelper.hPading, vertical: 10),
          itemCount: 2,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () => Get.to(() => ChatView(user: UserInfoBloc.of(context).user!)),
              leading: KProfilePic(user: UserInfoBloc.of(context).user!, radius: 60),
              title: Text(UserInfoBloc.of(context).user!.name!),
              subtitle: const Text('last message'),
            );
          },
        );
      },
    );
  }
}
