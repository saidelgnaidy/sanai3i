import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/view/auth/profile/iconed_text.dart';
import 'package:sanai3i/view/auth/profile/profile_pic.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: Get.width - 24,
                padding: const EdgeInsets.all(8).copyWith(top: KHelper.profilePicRadius + 8),
                margin: const EdgeInsets.only(top: KHelper.profilePicRadius),
                decoration: KHelper.of(context).elevatedBox,
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
              Positioned(top: 10, right: 10, child: IconButton(onPressed: () => FirebaseAuth.instance.signOut(), icon: const Icon(Icons.exit_to_app))),
              const Positioned(
                top: 10,
                child: KProfilePic(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: Get.width,
            decoration: KHelper.of(context).elevatedBox,
            child: SizedBox(
              child: Lottie.asset('assets/animations/working.json'),
            ),
          )
        ],
      ),
    );
  }
}
