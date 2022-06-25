import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/view/widgets/appbar.dart';
import 'package:sanai3i/view/widgets/button_to_dialog.dart';
import 'package:sanai3i/view/widgets/text_field.dart';

class CompleteInfoView extends StatelessWidget {
  const CompleteInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KTextFormField(
              hintText: Tr.get.name,
            ),
            ButtonToDialog(
              tag: 'tag',
              title: 'title',
              dialog: Container(
                width: Get.width,
                height: 300,
                color: KColors.of(context).rawMatBtn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
