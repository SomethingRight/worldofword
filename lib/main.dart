import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldofword/core/DI/service_locator.dart';
import 'package:worldofword/core/l10n/l10n.dart';
import 'package:worldofword/core/navigation/route_generator.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/core/settings/settings_storage.dart';
import 'package:worldofword/core/settings/theme.dart';
import 'package:worldofword/firebase_options.dart';
import 'package:worldofword/main_provider.dart';
import 'package:worldofword/module/menu/pages/settings/settings_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/* TODO 

 - Добавить фичу контекстное меню, новый пункт сохранения слова с словарь

 - add link to search field DONE

 - add individual profile data( i mean saved words) 

 - add all about sharing 

 - add focus to search field DONE

 - make global BLOC of app

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
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'WorldOfWord',
              theme: appThemeData[state.theme],
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: RouterI.authPage,
              supportedLocales: L10n.all,
              locale: state.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates);
        },
      ),
    );
  }
}
