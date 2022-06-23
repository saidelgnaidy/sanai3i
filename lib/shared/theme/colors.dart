import 'package:flutter/material.dart';

class KColors {
  BuildContext? context;
  KColors(this.context);

  static KColors of(BuildContext context) {
    return KColors(context);
  }

  //Light
  static const Color appbarL = Color(0xFFF5F5F5);
  static const Color reBackL = Color(0xFF5a585e);
  static const Color shadowL = Color(0x35000000);
  static const Color scaffoldL = Color(0xFFF5F5F5);
  static const Color codePickerL = Color(0xFFF5F5F5);
  static const Color rawMatBtnL = Colors.white;
  static const Color rawMatBtnL2 = Color(0x85ffffff);
  static const Color cursorL = Color(0xFF000000);
  static const Color inactiveIconsL = Color(0xFF5a585e);
  static const Color activeIconsL = Color(0xFFD8D8D8);

  //Dark
  static const Color appbarD = Color(0xFF191720);
  static const Color reBackD = Color(0xFFBDBDBD);
  static const Color shadowD = Color(0x17000000);
  static const Color scaffoldD = Color(0xFF191720);
  static const Color codePickerD = Color(0xFF282631);
  static const Color rawMatBtnD = Color(0xFF3b3941);
  static const Color rawMatBtnD2 = Color(0x853b3941);
  static const Color cursorD = Color(0xFFFFFFFF);
  static const Color inactiveIconsD = Color(0xFFBDBDBD);
  static const Color activeIconsD = Color(0xFF585858);

  //Getters
  Color get appbar {
    return Theme.of(context!).brightness == Brightness.dark ? appbarD : appbarL;
  }

  Color get background {
    return Theme.of(context!).brightness == Brightness.dark ? appbarD : appbarL;
  }

  Color get reBackground {
    return Theme.of(context!).brightness == Brightness.light ? appbarD : appbarL;
  }

  Color get border {
    return Theme.of(context!).brightness == Brightness.light ? appbarD.withOpacity(.2) : appbarL.withOpacity(.2);
  }

  Color get fabBackground {
    return Theme.of(context!).brightness == Brightness.light ? reBackD : reBackL;
  }

  Color get icon {
    return Theme.of(context!).brightness == Brightness.dark ? activeIconsL : activeIconsD;
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
    return Theme.of(context!).brightness == Brightness.light ? activeIconsD : activeIconsL;
  }

  Color get inactiveIcons {
    return Theme.of(context!).brightness == Brightness.dark ? inactiveIconsL : inactiveIconsD;
  }
}
