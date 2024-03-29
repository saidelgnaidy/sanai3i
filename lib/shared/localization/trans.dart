import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class Tr {
  static final BuildContext _context = Get.context!;

  static AppLocalizations get get {
    return AppLocalizations.of(_context)!;
  }

  static bool get isAr => get.localeName == 'ar';

  AppLocalizations? localizations = AppLocalizations.of(_context)!;

  static List<LocalizationsDelegate> delegates = <LocalizationsDelegate<dynamic>>[
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static List<Locale> supportedLocales = const [
    Locale('ar'),
    Locale('en'),
  ];

  static String isAvailable(bool value) {
   return value ? get.available : get.unAvailable;
  }
}
