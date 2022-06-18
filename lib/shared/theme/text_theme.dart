import 'package:flutter/material.dart';

class KTextStyle {
  BuildContext? context;
  KTextStyle(this.context);

  static KTextStyle of(BuildContext context) {
    return KTextStyle(context);
  }

  static KTextStyle get mode {
    return KTextStyle(null);
  }

  static const String fontFamily = 'font';

  //Light
  static const Color mainL = Colors.black;
  static const Color accentL = Colors.red;
  static const Color shadowL = Color(0x60000000);
  static const Color scaffoldL = Color(0xFFF5F5F5);

  //Dark
  static const Color mainD = Colors.white;
  static const Color accentD = Color(0xFF3b3941);
  static const Color accentD2 = Color(0xFF807c8d);
  static const Color shadowD = Color(0x80000000);

  //Getters
  TextStyle get appBar {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.light ? mainL : mainD,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    );
  }

  TextStyle get langSwitch {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.light ? mainL : mainD,
      fontSize: 15,
      fontFamily: fontFamily,
    );
  }

  TextStyle get body {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.light ? mainL : mainD,
      fontSize: 15,
      fontFamily: fontFamily,
    );
  }

  TextStyle get error {
    return const TextStyle(color: Colors.red, fontSize: 15, fontFamily: fontFamily);
  }

  TextStyle get rawBtn {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.dark ? mainL : mainD,
      fontSize: 16,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold
    );
  }

  TextStyle get hint {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.dark ? mainL.withOpacity(.5) : mainD.withOpacity(.5),
      fontSize: 16,
      fontFamily: fontFamily,
    );
  }

  TextStyle get title {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.dark ? mainL : mainD,
      fontSize: 16,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
    );
  }
}
