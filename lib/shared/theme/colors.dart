import 'package:flutter/material.dart';

class KColors {
  BuildContext? context;
  KColors(this.context);

  static KColors of(BuildContext context) {
    return KColors(context);
  }

  //Light
  static const Color backgrounL = Color(0xFFF5F5F5);
  static const Color elevatedBoxL = Color(0xFFFDF9FF);
  static const Color reBackL = Color(0xFF5a585e);
  static const Color shadowL = Color(0x35000000);
  static const Color codePickerL = Color(0xFFF5F5F5);
  static const Color rawMatBtnL = Colors.white;
  static const Color rawMatBtnL2 = Color(0xFF5a585e);
  static const Color cursorL = Color(0xFF000000);
  static const Color inactiveIconsL = Color(0xFF5a585e);
  static const Color activeIconsL = Color(0xFFD8D8D8);
  static const Color bANDwL = Color(0xFF000000);

  //Dark
  static const Color backgroundD = Color(0xFF191720);
  static const Color elevatedBoxD = Color(0xFF1D1C25);
  static const Color reBackD = Color(0xFFBDBDBD);
  static const Color shadowD = Color(0x15000000);
  static const Color codePickerD = Color(0xFF282631);
  static const Color rawMatBtnD = Color(0xFF302E35);
  static const Color rawMatBtnD2 = Color(0xFFBDBDBD);
  static const Color cursorD = Color(0xFFFFFFFF);
  static const Color inactiveIconsD = Color(0xFFBDBDBD);
  static const Color activeIconsD = Color(0xFF585858);
  static const Color bANDwD = Color(0xFFffffff);

  //Getters
  Color get appbar {
    return Theme.of(context!).brightness == Brightness.dark ? backgroundD : backgrounL;
  }

  Color get background {
    return Theme.of(context!).brightness == Brightness.dark ? backgroundD : backgrounL;
  }

  Color get elevatedBox {
    return Theme.of(context!).brightness == Brightness.light ? elevatedBoxL : elevatedBoxD;
  }

  Color get reBackground {
    return Theme.of(context!).brightness == Brightness.light ? backgroundD : backgrounL;
  }

  Color get border {
    return Theme.of(context!).brightness == Brightness.light ? backgroundD.withOpacity(.2) : backgrounL.withOpacity(.2);
  }

  Color get fabBackground {
    return Theme.of(context!).brightness == Brightness.light ? reBackD : reBackL;
  }

  Color get rawMatBtn {
    return Theme.of(context!).brightness == Brightness.light ? rawMatBtnL : rawMatBtnD;
  }

  Color get rawMatBtn2 {
    return Theme.of(context!).brightness == Brightness.dark ? rawMatBtnL2 : rawMatBtnD2;
  }

  Color get codePicker {
    return Theme.of(context!).brightness == Brightness.dark ? codePickerD : codePickerL;
  }

  Color get cursor {
    return Theme.of(context!).brightness == Brightness.light ? cursorD : cursorL;
  }

  Color get reCursor {
    return Theme.of(context!).brightness == Brightness.dark ? cursorD : cursorL;
  }

  Color get divider {
    return Theme.of(context!).brightness == Brightness.dark ? cursorD.withOpacity(.5) : cursorL.withOpacity(.5);
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

  Color get bANDw {
    return Theme.of(context!).brightness == Brightness.dark ? bANDwD : bANDwL;
  }

  Color get rebANDw {
    return Theme.of(context!).brightness == Brightness.light ? bANDwD : bANDwL;
  }
}
