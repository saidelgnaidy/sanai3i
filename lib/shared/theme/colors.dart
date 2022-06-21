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
  static const Color codePickerL = Color(0xFFF5F5F5);
  static const Color accentL = Colors.red;
  static const Color iconL = Color(0xffffffff);
  static const Color shadowL = Color(0x60000000);
  static const Color rawMatBtnL = Colors.white;
  static const Color rawMatBtnL2 = Color(0x85ffffff);
  static const Color cursorL = Colors.black;
  static const Color inactiveIconsL = Color(0x55ffffff);
  static const Color activeIconsL = Color(0xFFF5F5F5);

  //Dark
  static const Color appbarD = Color(0xFF191720);
  static const Color accentD = Color(0xFF3b3941);
  static const Color accentD2 = Color(0xFF807c8d);
  static const Color iconD = Color.fromARGB(255, 42, 40, 49);
  static const Color shadowD = Color(0x30000000);
  static const Color scaffoldD = Color(0xFF191720);
  static const Color codePickerD = Color.fromARGB(255, 40, 38, 49);
  static const Color rawMatBtnD = Color(0xFF3b3941);
  static const Color rawMatBtnD2 = Color(0x853b3941);
  static const Color cursorD = Colors.white;
  static const Color inactiveIconsD = Color(0x653b3941);
  static const Color activeIconsD = Color(0xFF191720);

  //Getters
  Color get appbar {
    return Theme.of(context!).brightness == Brightness.dark ? appbarD : appbarL;
  }

  Color get background {
    return Theme.of(context!).brightness == Brightness.dark ? appbarD : appbarL;
  }

  Color get fabBackground {
    return Theme.of(context!).brightness == Brightness.light ? appbarD.withOpacity(.7) : appbarL.withOpacity(.5);
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

  Color get codePicker {
    return Theme.of(context!).brightness == Brightness.dark ? codePickerD : codePickerL;
  }

  Color get rawMatBtn2 {
    return Theme.of(context!).brightness == Brightness.dark ? rawMatBtnL2 : rawMatBtnD2;
  }

  Color get cursor {
    return Theme.of(context!).brightness == Brightness.light ? cursorD : cursorL;
  }

  Color get divider {
    return Theme.of(context!).brightness == Brightness.light ? cursorD : cursorL;
  }

  Color get shadow {
    return Theme.of(context!).brightness == Brightness.light ? shadowD : shadowL;
  }

  Color get activeIcons {
    return Theme.of(context!).brightness == Brightness.light ? activeIconsD : activeIconsL;
  }

  Color get reIcon {
    return Theme.of(context!).brightness == Brightness.dark ? activeIconsD : activeIconsL;
  }

  Color get inactiveIcons {
    return Theme.of(context!).brightness == Brightness.dark ? inactiveIconsL : inactiveIconsD;
  }
}
