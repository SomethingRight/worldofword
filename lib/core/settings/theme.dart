import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:worldofword/core/settings/settings_storage.dart';

enum AppTheme { light, dark }

abstract class Variables {
  static AppTheme initialTheme =
      ThemeEnam().themeColorToEnum(SettingsStorage.readTheme());
  static bool toggledlight = true;
  static bool toggledDark = false;
  static double fontSize = SettingsStorage.readFontSize();
  static Locale locale = Locale(SettingsStorage.readLocale());
}

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData(
      primaryIconTheme: const IconThemeData(color: Colors.white),
      snackBarTheme: SnackBarThemeData(backgroundColor: Colors.grey.shade600),
      dialogBackgroundColor: Colors.grey.shade600,
      backgroundColor: Colors.grey.shade300,
      cardColor: Colors.grey.shade100,
      primaryColor: Colors.teal,
      primaryColorLight: Colors.teal.shade200,
      primaryColorDark: Colors.teal.shade700,
      //fontFamily: 'TiltNeon',
      iconTheme: const IconThemeData(color: Colors.white),
      splashColor: Colors.teal.shade300,
      colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light, primarySwatch: Colors.teal),
      textTheme: textThemeData(
          currentColor: Colors.black87, headerColor: Colors.white)),
  AppTheme.dark: ThemeData(
      primaryIconTheme: const IconThemeData(color: Colors.white70),
      snackBarTheme: SnackBarThemeData(backgroundColor: Colors.grey.shade700),
      dialogBackgroundColor: Colors.grey.shade700,
      backgroundColor: Colors.grey.shade700,
      cardColor: Colors.grey.shade900,
      primaryColor: Colors.teal.shade800,
      primaryColorLight: Colors.teal.shade500,
      primaryColorDark: Colors.teal.shade900,
      //fontFamily: 'TiltNeon',
      iconTheme: const IconThemeData(color: Colors.grey),
      splashColor: Colors.teal.shade500,
      colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark, primarySwatch: Colors.teal),
      textTheme: textThemeData(
          currentColor: Colors.white70, headerColor: Colors.white60)),
};

TextTheme textThemeData({Color? currentColor, Color? headerColor}) {
  return TextTheme(
    headline1: TextStyle(
        color: headerColor, fontSize: 24, fontWeight: FontWeight.w500),
    headline2: TextStyle(
        color: currentColor, fontSize: 27, fontWeight: FontWeight.w600),
    headline3: TextStyle(
        color: currentColor, fontSize: 22, fontWeight: FontWeight.w400),
    headline4: TextStyle(
        color: currentColor, fontSize: 24, fontWeight: FontWeight.w400),
    headline5: TextStyle(
        color: currentColor, fontSize: 18, fontWeight: FontWeight.normal),
    headline6: TextStyle(
        color: currentColor, fontSize: 21, fontWeight: FontWeight.normal),
    bodyText1: TextStyle(
        color: currentColor, fontSize: 17, fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: currentColor, fontSize: 20, fontWeight: FontWeight.normal),
  );
}

class ThemeEnam {
  AppTheme themeColorToEnum(String themeColorStr) {
    switch (themeColorStr) {
      case 'dark_theme':
        {
          return AppTheme.dark;
        }
      case 'light_theme':
        {
          return AppTheme.light;
        }
      default:
        {
          return AppTheme.light;
        }
    }
  }

  String themeColorFromEnum(AppTheme appTheme) {
    String? themeColorStr;
    switch (appTheme) {
      case AppTheme.dark:
        {
          themeColorStr = 'dark_theme';
          break;
        }
      case AppTheme.light:
        {
          themeColorStr = 'light_theme';
          break;
        }
      default:
        {
          themeColorStr = null;
        }
    }
    return themeColorStr!;
  }
}