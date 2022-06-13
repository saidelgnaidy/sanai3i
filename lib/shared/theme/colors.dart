import 'package:flutter/material.dart';

class KColors {
  BuildContext? context;
  KColors(this.context);

  static KColors of(BuildContext context) {
    return KColors(context);
  }

  //Light
  static const Color appbarL = Color(0xFFF5F5F5);
  static const Color scaffoldL = Color(0xFFF5F5F5);
  static const Color accentL = Colors.red;
  static const Color iconL = Color(0xffffffff);
  static const Color shadowL = Color(0x60000000);
  static const Color rawMatBtnL = Colors.white;

  //Dark
  static const Color appbarD = Color(0xFF191720);
  static const Color accentD = Color(0xFF3b3941);
  static const Color accentD2 = Color(0xFF807c8d);
  static const Color iconD = Color.fromARGB(255, 42, 40, 49);
  static const Color shadowD = Color(0x80000000);
  static const Color scaffoldD = Color(0xFF191720);
  static const Color rawMatBtnD = Color(0xFF3b3941);

  //Getters
  Color get appBar {
    return Theme.of(context!).brightness == Brightness.dark ? appbarD : appbarL;
  }

  Color get accent {
    return Theme.of(context!).brightness == Brightness.dark ? accentD : accentL;
  }

  Color get icon {
    return Theme.of(context!).brightness == Brightness.dark ? iconL : iconD;
  }

  Color get rawMatBtn {
    return Theme.of(context!).brightness == Brightness.dark ? rawMatBtnL : rawMatBtnD;
  }
}
