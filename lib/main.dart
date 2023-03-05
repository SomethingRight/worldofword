import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldofword/core/DI/service_locator.dart';
import 'package:worldofword/core/navigation/route_generator.dart';
import 'package:worldofword/core/navigation/router.dart';
import 'package:worldofword/firebase_options.dart';
import 'package:worldofword/module/saved_words/saved_words_bloc.dart';

import 'module/auth/email_pass_auth/firebase_auth_bloc.dart';
import 'module/auth/sign_up_auth/sign_up_bloc.dart';
import 'module/main_page/word_load_bloc.dart';
import 'module/menu/pages/user/user_page_bloc.dart';
import 'module/word_details_page/word_details_bloc.dart';

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
        BlocProvider<FirebaseAuthBloc>(
            create: (context) => getIt.get<FirebaseAuthBloc>()),
        BlocProvider<SignUpBloc>(
          create: (context) => getIt.get<SignUpBloc>()),
        BlocProvider<UserPageBloc>(
            create: (context) => getIt.get<UserPageBloc>()),
        BlocProvider<SavedWordsBloc>(
            create: (context) => getIt.get<SavedWordsBloc>()),
        BlocProvider<WordDetailsBloc>(
            create: (context) => getIt.get<WordDetailsBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WorldOfWord',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          fontFamily: 'TiltNeon',
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: RouterI.authPage,
      ),
    );
  }
}
