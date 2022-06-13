import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanai3i/shared/theme/colors.dart';

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
      scaffoldBackgroundColor: KColors.scaffoldL,
      appBarTheme: const AppBarTheme(
        color: KColors.appbarL,
        systemOverlayStyle: _lightOverLay,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: KColors.accentD),
      ),
      textTheme: _textTheme,
      shadowColor: KColors.shadowL,
      inputDecorationTheme: _inputDecorationTheme.copyWith(prefixIconColor: KColors.accentL),
      iconTheme: const IconThemeData(color: KColors.accentL),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: KColors.accentL),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(KColors.accentL),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const StadiumBorder(),
          ),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData.dark().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: KColors.scaffoldD,
      appBarTheme: const AppBarTheme(
        color: KColors.appbarD,
        systemOverlayStyle: _darkOverLay,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: KColors.accentL),
      ),
      textTheme: _textTheme,
      shadowColor: KColors.shadowD,
      inputDecorationTheme: _inputDecorationTheme.copyWith(prefixIconColor: KColors.accentD),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: KColors.accentD),
      iconTheme: const IconThemeData(color: KColors.accentD),
      buttonTheme: const ButtonThemeData(buttonColor: KColors.accentD),
      popupMenuTheme: const PopupMenuThemeData(elevation: 0),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(KColors.accentD),
        ),
      ),
    );
  }

  static const InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    enabledBorder: InputBorder.none,
    border: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
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
