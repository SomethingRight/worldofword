import 'package:flutter/material.dart';
import 'package:worldofword/module/auth/auth_page.dart';
import 'package:worldofword/module/home/home_page.dart';
import 'package:worldofword/module/menu/pages/info/info_page.dart';
import 'package:worldofword/module/menu/pages/settings/settings_page.dart';
import 'package:worldofword/module/menu/pages/sharing/sharing_page.dart';
import 'package:worldofword/module/menu/pages/user/user_page.dart';
import 'package:worldofword/module/word_details_page/word_details_page.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final dynamic arguments = settings.arguments;
    final String name = settings.name!;
    switch (name) {
      case '/home':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const HomePage());
      case '/settings':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const SettingsPage());
      case '/user':
        return MaterialPageRoute<dynamic>(builder: (context) => const UserPage());
      case '/share':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const SharingPage());
      case '/info':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const InfoPage());
      case '/wordDetails':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const WordDetailsPage());
      case '/':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const AuthPage());
    }
  }
}
