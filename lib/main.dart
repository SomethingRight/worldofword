import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/auth/firebase_auth_api.dart';
import 'package:worldofword/api/word_api/word_traslate/word_translate_repository.dart';
import 'package:worldofword/core/DI/service_locator.dart';
import 'package:worldofword/core/navigation/route_generator.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/firebase_options.dart';

import 'module/auth/email_pass_auth/firebase_auth_bloc.dart';
import 'module/auth/sign_up_auth/sign_up_bloc.dart';
import 'module/main_page/word_load_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WordLoadBloc>(
            create: (context) => getIt.get<WordLoadBloc>()),
            //WordLoadBloc(WordTranslateRepository())),
        BlocProvider<FirebaseAuthBloc>(
            create: (context) => getIt.get<FirebaseAuthBloc>()),
            //FirebaseAuthBloc(authService: FirebaseAuthApi())),
        BlocProvider<SignUpBloc>(
            create: (context) => getIt.get<SignUpBloc>()),
            //SignUpBloc(authService: FirebaseAuthApi())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WorldOfWord',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: RouterI.authPage,
      ),
    );
  }
}
