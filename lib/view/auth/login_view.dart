import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RawMaterialButton(
              onPressed: () {},
              fillColor: KColors.of(context).rawMatBtn,
              shape: KHelper.btnShape,
              elevation: 0,
              child: SizedBox(
                width: Get.width,
                height: 50,
                child: Center(
                  child: Text(
                    Tr.get.login_register,
                    style: KTextStyle.of(context).rawBtn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
