import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/auth/auth_dialog.dart';
import 'package:sanai3i/view/widgets/appbar.dart';
import 'package:sanai3i/view/widgets/button_to_dialog.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: Get.size.width,
              height: Get.size.height / 2.5,
              child: Lottie.asset('assets/animations/working.json'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Text(
                Tr.get.description,
                textAlign: TextAlign.center,
                style: KTextStyle.of(context).body,
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ButtonToDialog(
                tag: 'login',
                title: Tr.get.login_register,
                dialog: const AuthDialog(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
