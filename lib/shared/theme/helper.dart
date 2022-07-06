import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class KHelper {
  BuildContext? context;
  KHelper(this.context);
  static KHelper of(BuildContext context) {
    return KHelper(context);
  }

  static showSnackBar(String msg, {bool? isTop}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      '',
      '',
      snackPosition: isTop ?? false ? SnackPosition.TOP : SnackPosition.BOTTOM,
      barBlur: 10.0,
      backgroundColor: Colors.black.withOpacity(.6),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 8),
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.decelerate,
      dismissDirection: DismissDirection.horizontal,
      colorText: Colors.white,
      messageText: Text(
        msg,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }

  static void launchCaller(numper) async {
    try {
      launchUrlString('tel:$numper');
    } catch (e) {
      showSnackBar(Tr.get.something_went_wrong);
    }
  }

  /// Icons data *****************************
  static const IconData person = Icons.person;
  static const IconData phone = Icons.phone_rounded;
  static const IconData services = Icons.home_repair_service;
  static const IconData available = Icons.timelapse;
  static const IconData whatsapp = Icons.whatsapp;
  static const IconData home = Icons.home;
  static const IconData notifications = Icons.notifications;
  static const IconData edit = Icons.edit;
  static const IconData delete = Icons.delete;
  static const IconData qrCode = Icons.qr_code;
  static const IconData favorite = Icons.favorite_rounded;
  static const IconData chat = Icons.chat_bubble_rounded;

  static IconData fabIcon(index) {
    if (index == 3) return Icons.add;
    return Icons.search;
  }

  static const double btnRadius = 12.0;
  static const double cornerRadius = 8.0;
  static const double hPading = 12.0;
  static const double profilePicRadius = 60;
  static const double profilePicWidth = 100;
  static ShapeBorder btnShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(btnRadius));

  BoxDecoration get elevatedBox {
    return BoxDecoration(
      color: KColors.of(context!).elevatedBox,
      borderRadius: BorderRadius.circular(cornerRadius),
      boxShadow: [
        BoxShadow(color: KColors.of(context!).shadow, blurRadius: 4, offset: const Offset(0, 4)),
      ],
    );
  }

  BoxDecoration get shimmerBox {
    return BoxDecoration(
      color: KColors.of(context!).elevatedBox.withOpacity(.2),
      borderRadius: BorderRadius.circular(cornerRadius),
    );
  }

  Gradient get shimmerGradiant {
    return LinearGradient(colors: [
      KColors.of(context!).shadow.withOpacity(.2),
      KColors.of(context!).shadow.withOpacity(.5),
    ]);
  }

  BoxDecoration get elevatedCircle {
    return BoxDecoration(
      color: KColors.of(context!).elevatedBox,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: KColors.of(context!).shadow, blurRadius: 10, offset: const Offset(5, 5), spreadRadius: 5),
      ],
    );
  }

  BoxDecoration get outlined {
    return BoxDecoration(
      border: Border.all(color: KColors.of(context!).border, width: .5),
      borderRadius: BorderRadius.circular(cornerRadius),
    );
  }

  BoxDecoration get outlinedCircle {
    return BoxDecoration(
      border: Border.all(color: KColors.of(context!).border, width: .5),
      shape: BoxShape.circle,
      color: KColors.of(context!).background,
    );
  }
}
