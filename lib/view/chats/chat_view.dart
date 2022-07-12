import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sanai3i/logic/chat/chat_states.dart';
import 'package:sanai3i/logic/chat/chats_bloc.dart';
import 'package:sanai3i/models/chat/message_model.dart';
import 'package:sanai3i/models/user/user_model.dart';
import 'package:sanai3i/shared/localization/trans.dart';

import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/widgets/appbar.dart';
import 'package:sanai3i/view/widgets/loading_widget.dart';
import 'package:sanai3i/view/widgets/text_field.dart';

class ChatView extends StatelessWidget {
  final KUser user;
  const ChatView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        ChatBloc.of(context).setMsg(user.uid!);
        return Scaffold(
          appBar: const KAppBar(),
          body: Column(
            children: [
              Expanded(
                child: StreamBuilder<List<MessageModel>>(
                  stream: ChatBloc.of(context).chatStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const KLoadingWidget();
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return ChatBubble(
                          messageModel: snapshot.data![index],
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(KHelper.hPading),
                child: Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<ChatBloc, ChatState>(
                        builder: (context, state) {
                          return KTextFormField(
                            controller: ChatBloc.of(context).teCtrl,
                            hintText: Tr.get.message,
                            errorText: state.mapOrNull(error: (value) => value.error),
                          );
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        ChatBloc.of(context).sendMessage;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ChatBubble extends StatelessWidget {
  final MessageModel messageModel;
  const ChatBubble({Key? key, required this.messageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: messageModel.isMe! ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: Get.width * .7),
        padding: const EdgeInsets.symmetric(horizontal: KHelper.hPading).copyWith(top: 8, bottom: 5),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        decoration: KHelper.of(context).messageBubble(isSender: messageModel.isMe!),
        child: Text(
          messageModel.content!,
          style: KTextStyle.of(context).body2,
          textAlign: messageModel.isMe! ? TextAlign.right : TextAlign.left,
        ),
      ),
    );
  }
}
