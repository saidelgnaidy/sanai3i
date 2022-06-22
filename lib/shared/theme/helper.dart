import 'package:flutter/material.dart';
import 'package:sanai3i/shared/theme/colors.dart';

class KHelper {
  BuildContext? context;
  KHelper(this.context);
  static KHelper of(BuildContext context) {
    return KHelper(context);
  }

  /// Icons data *****************************
  static const IconData person = Icons.person;
  static const IconData phone = Icons.phone;
  static const IconData services = Icons.home_repair_service;
  static const IconData available = Icons.timelapse;
  static const IconData whatsapp = Icons.whatsapp;
  static const IconData home = Icons.home;
  static const IconData notifications = Icons.notifications;
  static IconData search(index) {
    if (index == 3) return Icons.add;
    return Icons.search;
  }

  static const IconData chat = Icons.chat_bubble;

  static const double btnRadius = 12.0;
  static const double cornerRadius = 8.0;
  static const double profilePicRadius = 60;
  static const double profilePicWidth = 100;
  static ShapeBorder btnShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(btnRadius));

  BoxDecoration get elevatedBox {
    return BoxDecoration(
      color: KColors.of(context!).background,
      borderRadius: BorderRadius.circular(cornerRadius),
      boxShadow: [
        BoxShadow(color: KColors.of(context!).shadow, blurRadius: 5, offset: const Offset(0, 5), spreadRadius: 2),
      ],
    );
  }

  BoxDecoration get elevatedCircle {
    return BoxDecoration(
      color: KColors.of(context!).background,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: KColors.of(context!).shadow, blurRadius: 10, offset: const Offset(5, 5), spreadRadius: 5),
      ],
    );
  }

  BoxDecoration get outlined {
    return BoxDecoration(
      border: Border.all(color: KColors.of(context!).reBackground.withOpacity(.1), width: 1),
      borderRadius: BorderRadius.circular(cornerRadius),
    );
  }
}
