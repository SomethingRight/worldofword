import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:worldofword/core/DI/service_locator.dart';
import 'package:worldofword/core/l10n/l10n.dart';
import 'package:worldofword/core/navigation/context_provider.dart';
import 'package:worldofword/core/navigation/route_generator.dart';
import 'package:worldofword/core/settings/settings_storage.dart';
import 'package:worldofword/core/settings/theme.dart';
import 'package:worldofword/firebase_options.dart';
import 'package:worldofword/main_bloc/main_bloc.dart';
import 'package:worldofword/main_provider.dart';
import 'package:worldofword/module/auth/email_pass_auth/auth_page.dart';
import 'package:worldofword/module/home/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:worldofword/module/widgets/snackbar_global.dart';

import 'models/app_state.dart';

/* TODO 

 - Добавить фичу контекстное меню, новый пункт сохранения слова с словарь

 - add individual profile data( i mean saved words) DONE

 - add all about sharing 

*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SettingsStorage.init();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MainProvider.listProviders,
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return MaterialApp(
            scaffoldMessengerKey: SnackbarGlobal.key,
            debugShowCheckedModeBanner: false,
            title: 'WorldOfWord',
            theme: appThemeData[state.theme],
            onGenerateRoute: AppRouter.onGenerateRoute,
            navigatorKey: GetIt.I<ContextProviderI>().getNavigationKey(),
            supportedLocales: L10n.all,
            locale: state.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: home(state),
          );
        },
      ),
    );
  }

  Widget home(MainState state) {
    debugPrint('@@@state is $state');
    if (state.authState is LoginState) {
      return HomePage(indexPage: 1);
    }
    if (state.authState is UnloginState) {
      return const AuthPage();
    } else {
      return const AuthPage();
    }
  }
}
