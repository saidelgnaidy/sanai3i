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
  static const Color mainL = Color(0xFF555555);

  //Dark
  static const Color mainD = Color(0xffd5d5d5);

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

  TextStyle get reBody {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.dark ? mainL : mainD,
      fontSize: 15,
      fontFamily: fontFamily,
    );
  }

  TextStyle get body2 {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.light ? mainL : mainD,
      fontSize: 12.5,
      fontFamily: fontFamily,
    );
  }

  TextStyle get body3 {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.light ? mainL : mainD,
      fontSize: 10,
      fontFamily: fontFamily,
    );
  }

  TextStyle get error {
    return const TextStyle(color: Colors.red, fontSize: 15, fontFamily: fontFamily);
  }

  TextStyle get rawBtn {
    return TextStyle(
        color: Theme.of(context!).brightness == Brightness.dark ? mainL : mainD, fontSize: 16, fontFamily: fontFamily, fontWeight: FontWeight.bold);
  }

  TextStyle get hint {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.light ? mainL.withOpacity(.5) : mainD.withOpacity(.5),
      fontSize: 16,
      fontFamily: fontFamily,
    );
  }

  TextStyle get rehint {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.dark ? mainL.withOpacity(.7) : mainD.withOpacity(.6),
      fontSize: 16,
      fontFamily: fontFamily,
    );
  }

  TextStyle get title {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.light ? mainL : mainD,
      fontSize: 16,
      fontFamily: fontFamily,
    );
  }

  TextStyle get title2 {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.light ? mainL : mainD,
      fontSize: 16,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get reTitle {
    return TextStyle(
      color: Theme.of(context!).brightness == Brightness.dark ? mainL : mainD,
      fontSize: 16,
      fontFamily: fontFamily,
    );
  }

  TextStyle get textBtn {
    return const TextStyle(
      color: Color(0xFF629CFF),
      fontSize: 16,
      fontFamily: fontFamily,
    );
  }
}
