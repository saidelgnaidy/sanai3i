import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/shared/const.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/profile/iconed_text.dart';
import 'package:sanai3i/view/profile/profile_pic.dart';
import 'package:sanai3i/view/qr_code/qr_code.dart';
import 'package:sanai3i/view/widgets/button_to_dialog.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              KMainContainer(
                padding: const EdgeInsets.all(8).copyWith(top: KHelper.profilePicRadius + 8),
                margin: const EdgeInsets.only(top: KHelper.profilePicRadius),
                child: Column(
                  children: const [
                    KIconedText(title: 'said ahmed mohamed', icon: KHelper.person),
                    SizedBox(height: 6),
                    KIconedText(title: '+2001140230179', icon: KHelper.phone),
                    SizedBox(height: 6),
                    KIconedText(title: 'Flutter developer', icon: KHelper.services),
                    SizedBox(height: 6),
                    KIconedText(title: 'Available', icon: KHelper.available),
                  ],
                ),
              ),
              Positioned(
                top: KHelper.profilePicRadius + 8,
                right: 8,
                child: KIconButton(
                  child: const Icon(KHelper.edit),
                  onPressed: () {},
                ),
              ),
              const Positioned(
                top: KHelper.profilePicRadius + 8,
                left: 8,
                child: KIconToDialog(
                  title: '',
                  tag: 'QR',
                  dialog: QRCodeView(),
                ),
              ),
              const Positioned(
                top: 10,
                child: KProfilePic(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          KMainContainer(
            width: Get.width,
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    KIconButton(
                      child: const Icon(KHelper.delete),
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Test post Body',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: KTextStyle.of(context).body,
                  ),
                ),
                Container(
                  decoration: KHelper.of(context).outlined,
                  child: Lottie.asset('assets/animations/working.json'),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text('2022/06/23', style: KTextStyle.of(context).body2),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
