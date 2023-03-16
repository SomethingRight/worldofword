import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import 'core/di/service_locator.dart';
import 'module/auth/email_pass_auth/firebase_auth_bloc.dart';
import 'module/auth/sign_up_auth/sign_up_bloc.dart';
import 'module/main_page/word_load_bloc.dart';
import 'module/menu/pages/settings/settings_bloc.dart';
import 'module/menu/pages/user/user_page_bloc.dart';
import 'module/saved_words/saved_words_bloc.dart';
import 'module/word_details_page/word_details_bloc.dart';

class MainProvider {
  static List<SingleChildWidget> listProviders = [
    BlocProvider<WordLoadBloc>(create: (context) => getIt.get<WordLoadBloc>()),
    BlocProvider<FirebaseAuthBloc>(
        create: (context) => getIt.get<FirebaseAuthBloc>()),
    BlocProvider<SignUpBloc>(create: (context) => getIt.get<SignUpBloc>()),
    BlocProvider<UserPageBloc>(create: (context) => getIt.get<UserPageBloc>()),
    BlocProvider<SavedWordsBloc>(
        create: (context) => getIt.get<SavedWordsBloc>()),
    BlocProvider<WordDetailsBloc>(
        create: (context) => getIt.get<WordDetailsBloc>()),
    BlocProvider<SettingsBloc>(create: (context) => getIt.get<SettingsBloc>()),
  ];
}
