import 'package:flutter/material.dart';
import 'package:sanai3i/shared/localization/trans.dart';

import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/widgets/appbar.dart';
import 'package:sanai3i/view/widgets/shared_components.dart';
import 'package:sanai3i/view/widgets/text_field.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return ChatBubble(
                  content: Tr.get.no_connection,
                  isSender: index.isEven,
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: KTextFormField(
              suffixIcon: KIconButton(child: Icon(Icons.send)),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool? isSender;
  final String content;
  const ChatBubble({
    Key? key,
    this.isSender = true,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender! ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: KHelper.of(context).messageBubble(isSender!),
        child: Text(content, style: KTextStyle.of(context).body),
      ),
    );
  }
}
