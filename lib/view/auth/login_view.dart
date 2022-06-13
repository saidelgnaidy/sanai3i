import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/shared/const.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/shared/widgets/custom_drop.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ButtonToDialog(
              tag: 'login',
              dialogHeight: 300,
              child: LimitedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            autofocus: true,
                            style: KTextStyle.of(context).title,
                            textAlign: TextAlign.center,
                            cursorColor: KColors.of(context).cursor,
                            decoration: InputDecoration(
                              hintText: 'Phone',
                              hintStyle: KTextStyle.of(context).hint,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        KButton(
                          onPressed: () {},
                          width: Get.width / 2,
                          title: 'Check',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
