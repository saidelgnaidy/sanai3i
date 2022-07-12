import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

@immutable
class SettingsState {}

class SettingsBloc extends Cubit<SettingsState> {
  SettingsBloc() : super(SettingsState());

  final GetStorage storage = GetStorage();
  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;
  late Locale _locale;
  Locale get locale => _locale;

  static SettingsBloc of(BuildContext context) {
    return BlocProvider.of<SettingsBloc>(context);
  }

  void loadSettings() {
    _themeMode = _readTheme();
    _locale = _readLocale();
    emit(SettingsState());
  }

  void updateThemeMode() {
    switch (_themeMode) {
      case ThemeMode.dark:
        _themeMode = ThemeMode.light;
        break;
      case ThemeMode.light:
        _themeMode = ThemeMode.dark;
        break;
      case ThemeMode.system:
        _themeMode = Get.theme.brightness == Brightness.dark ? ThemeMode.light : ThemeMode.light;
        break;
      default:
        _themeMode = ThemeMode.system;
    }
    emit(SettingsState());
    storage.write('themeMode', _themeMode.toString());
  }

  ThemeMode _readTheme() {
    if (storage.read('themeMode') == null) {
      return ThemeMode.system;
    }
    if (storage.read('themeMode') == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    }
    if (storage.read('themeMode') == ThemeMode.light.toString()) {
      return ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }

  Locale _readLocale() {
    if (storage.read('locale') == null) {
      return const Locale('ar');
    } else {
      return Locale(storage.read('locale'));
    }
  }

  void updateLocale() {
    _locale.languageCode == 'en' ? _locale = const Locale('ar') : _locale = const Locale('en');
    emit(SettingsState());
    Get.updateLocale(_locale);
    storage.write('locale', _locale.languageCode);
  }
}
