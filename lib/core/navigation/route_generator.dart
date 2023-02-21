import 'package:flutter/material.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/module/auth/auth_page.dart';
import 'package:worldofword/module/home/home_page.dart';
import 'package:worldofword/module/menu/pages/info/info_page.dart';
import 'package:worldofword/module/menu/pages/settings/settings_page.dart';
import 'package:worldofword/module/menu/pages/sharing/sharing_page.dart';
import 'package:worldofword/module/menu/pages/user/user_page.dart';
import 'package:worldofword/module/word_details_page/word_details_page.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    final String name = settings.name!;
    switch (name) {
      case RouterI.homePage:
        return _navigate(const HomePage());
      case RouterI.settingsPage:
        return _navigate(const SettingsPage());
      case RouterI.userPage:
        return _navigate(const UserPage());
      case RouterI.sharingPage:
        return _navigate(const SharingPage());
      case RouterI.infoPage:
        return _navigate(const InfoPage());
      case RouterI.wordDetailsPage:
        return _navigate(const WordDetailsPage());
      case RouterI.authPage:
        return _navigate(const AuthPage());
    }
    return null;
  }

  static MaterialPageRoute<dynamic> _navigate(Widget widget) {
    return MaterialPageRoute<dynamic>(builder: (context) => widget);
  }
}
