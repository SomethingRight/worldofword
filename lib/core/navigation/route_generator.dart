import 'package:flutter/material.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/module/auth/account_recovery/account_recovery_page.dart';
import 'package:worldofword/module/auth/email_pass_auth/auth_page.dart';
import 'package:worldofword/module/auth/sign_up_auth/sign_up_page.dart';
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
        final Map<String, dynamic> homePageArgs = args;
        return _navigate(HomePage(
          indexPage: homePageArgs['index'] ?? 1,
        ));
      case RouterI.settingsPage:
        return _navigate(const SettingsPage());
      case RouterI.userPage:
        return _navigate(const UserPage());
      case RouterI.sharingPage:
        return _navigate(const SharingPage());
      case RouterI.infoPage:
        return _navigate(const InfoPage());
      case RouterI.wordDetailsPage:
        final Map<String, dynamic> argsWord = args as Map<String, dynamic>;
        return _navigate(WordDetailsPage(
            word: argsWord['word'], translation: argsWord['translation']));
      case RouterI.authPage:
        return _navigate(const AuthPage());
      case RouterI.signUpPage:
        return _navigate(const SignUpPage());
      case RouterI.accountRecoveryPage:
        _navigate(const AccountRecoveryPage());
    }
    return null;
  }

  static MaterialPageRoute<dynamic> _navigate(Widget widget) {
    return MaterialPageRoute<dynamic>(builder: (context) => widget);
  }
}
