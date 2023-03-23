import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'context_provider.dart';

@Singleton(as: RouterI)
class Router implements RouterI {
  const Router({required this.contextProvider});

  final ContextProviderI contextProvider;

  @override
  Future navigateReplacementTo(String routeName, {Object? arg}) {
    return contextProvider
        .getNavigationKey()
        .currentState!
        .pushReplacementNamed(routeName, arguments: arg);
  }

  @override
  Future navigateTo(String routeName, {Object? arg}) {
    return contextProvider
        .getNavigationKey()
        .currentState!
        .pushNamed(routeName, arguments: arg);
  }

  @override
  void pop<T extends Object>([T? result]) {
    return contextProvider.getNavigationKey().currentState?.pop();
  }
}

abstract class RouterI {
  static const String homePage = 'HomePage';
  static const String settingsPage = 'SettingsPage';
  static const String userPage = 'UserPage';
  static const String sharingPage = 'SharingPage';
  static const String infoPage = 'InfoPage';
  static const String wordDetailsPage = 'WordDetailsPage';
  static const String authPage = 'AuthorizationPage';
  static const String signUpPage = 'SignUpPage';
  static const String accountRecoveryPage = 'AccountRecoveryPage';

  Future<dynamic> navigateTo(String routeName, {Object? arg});

  Future<dynamic> navigateReplacementTo(String routeName, {Object? arg});

  void pop<T extends Object>([T? result]);
}
