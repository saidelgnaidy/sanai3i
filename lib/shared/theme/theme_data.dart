import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';

class KThemeData {
  BuildContext? context;
  KThemeData(this.context);

  SystemUiOverlayStyle get overlayStyle {
    return Theme.of(context!).brightness == Brightness.light ? _lightOverLay : _darkOverLay;
  }

  static KThemeData of(BuildContext context) {
    return KThemeData(context);
  }

  static ThemeData get light {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: KColors.backgrounL,
      appBarTheme: const AppBarTheme(
        color: KColors.backgrounL,
        systemOverlayStyle: _lightOverLay,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: KColors.activeIconsL),
      ),
      textTheme: _textTheme,
      shadowColor: KColors.shadowL,
      inputDecorationTheme: inputDecorationTheme(color: KColors.backgroundD.withOpacity(.5)),
      iconTheme: const IconThemeData(color: KColors.activeIconsD),
      elevatedButtonTheme: elevatedBtnTheme(shadow: KColors.shadowL, background: KColors.elevatedBoxL),
    );
  }

  static ThemeData get dark {
    return ThemeData.dark().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: KColors.backgroundD,
      appBarTheme: const AppBarTheme(
        color: KColors.backgroundD,
        systemOverlayStyle: _darkOverLay,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: KColors.activeIconsD),
      ),
      textTheme: _textTheme,
      shadowColor: KColors.shadowD,
      inputDecorationTheme: inputDecorationTheme(color: KColors.backgrounL.withOpacity(.5)),
      iconTheme: const IconThemeData(color: KColors.activeIconsL),
      elevatedButtonTheme: elevatedBtnTheme(shadow: KColors.shadowD, background: KColors.elevatedBoxD),
    );
  }

  static ElevatedButtonThemeData elevatedBtnTheme({required Color shadow, required Color background}) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        shadowColor: MaterialStateProperty.all<Color>(shadow),
        elevation: MaterialStateProperty.all<double>(5.0),
        backgroundColor: MaterialStateProperty.all<Color>(background),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(KHelper.btnRadius),
          ),
        ),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme({required Color color}) {
    return InputDecorationTheme(
      border: outlineInputBorder(color: color),
      disabledBorder: outlineInputBorder(color: color),
      errorBorder: outlineInputBorder(color: color),
      focusedErrorBorder: outlineInputBorder(color: color),
      enabledBorder: outlineInputBorder(color: color),
      focusedBorder: outlineInputBorder(color: color),
    );
  }

  InputDecoration get inputBorderDecoration {
    return Theme.of(context!).brightness == Brightness.light ? inputDecoration(color: KColors.backgrounL) : inputDecoration(color: KColors.backgroundD);
  }

  static InputDecoration inputDecoration({required Color color}) => InputDecoration(
        border: outlineInputBorder(color: color),
        disabledBorder: outlineInputBorder(color: color),
        errorBorder: outlineInputBorder(color: color),
        focusedErrorBorder: outlineInputBorder(color: color),
        enabledBorder: outlineInputBorder(color: color),
        focusedBorder: outlineInputBorder(color: color),
      );

  static OutlineInputBorder outlineInputBorder({required Color color}) => OutlineInputBorder(
        borderSide: BorderSide(width: .75, color: color),
        borderRadius: BorderRadius.circular(KHelper.btnRadius),
      );

  static const SystemUiOverlayStyle _darkOverLay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const SystemUiOverlayStyle _lightOverLay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
  static const TextStyle _textStyle = TextStyle(fontFamily: 'font');

  static const TextTheme _textTheme = TextTheme(
    headline1: _textStyle,
    headline2: _textStyle,
    headline3: _textStyle,
    headline4: _textStyle,
    headline5: _textStyle,
    headline6: _textStyle,
    bodyText1: _textStyle,
    bodyText2: _textStyle,
    subtitle1: _textStyle,
    subtitle2: _textStyle,
    headlineLarge: _textStyle,
    button: _textStyle,
    caption: _textStyle,
    labelMedium: _textStyle,
    overline: _textStyle,
  );
}
