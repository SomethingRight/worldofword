// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:worldofword/api/auth/auth_repository.dart' as _i18;
import 'package:worldofword/api/auth/firebase_auth_api.dart' as _i5;
import 'package:worldofword/api/auth/firebase_provider.dart' as _i7;
import 'package:worldofword/api/exception/exception_handler.dart' as _i4;
import 'package:worldofword/api/firestore/firestore_provider.dart' as _i8;
import 'package:worldofword/api/word_api/word_details/word_details_api.dart'
    as _i14;
import 'package:worldofword/api/word_api/word_details/word_details_repository.dart'
    as _i15;
import 'package:worldofword/api/word_api/word_traslate/word_translate_api.dart'
    as _i16;
import 'package:worldofword/api/word_api/word_traslate/word_translate_repository.dart'
    as _i17;
import 'package:worldofword/core/navigation/context_provider.dart' as _i3;
import 'package:worldofword/core/navigation/router.dart' as _i9;
import 'package:worldofword/core/settings/settings_storage.dart' as _i11;
import 'package:worldofword/module/auth/email_pass_auth/firebase_auth_bloc.dart'
    as _i6;
import 'package:worldofword/module/auth/sign_up_auth/sign_up_bloc.dart' as _i12;
import 'package:worldofword/module/main_page/word_load_bloc.dart' as _i21;
import 'package:worldofword/module/menu/pages/settings/settings_bloc.dart'
    as _i19;
import 'package:worldofword/module/menu/pages/user/user_page_bloc.dart' as _i13;
import 'package:worldofword/module/saved_words/saved_words_bloc.dart' as _i10;
import 'package:worldofword/module/word_details_page/word_details_bloc.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ContextProviderI>(_i3.ContextProvider());
    gh.lazySingleton<_i4.ExceptionHandlerI>(() => _i4.ExceptionHandler());
    gh.factory<_i5.FbAuthApiI>(() => _i5.FirebaseAuthApi(
        fbLoginExceptionConverter: gh<_i4.ExceptionHandlerI>()));
    gh.factory<_i6.FirebaseAuthBloc>(
        () => _i6.FirebaseAuthBloc(authService: gh<_i5.FbAuthApiI>()));
    gh.lazySingleton<_i7.FirebaseProviderI>(() => _i7.FirebaseProvider());
    gh.factory<_i8.FirestoreProviderI>(() => _i8.FirestoreProvider());
    gh.singleton<_i9.RouterI>(
        _i9.Router(contextProvider: gh<_i3.ContextProviderI>()));
    gh.factory<_i10.SavedWordsBloc>(() =>
        _i10.SavedWordsBloc(firestoreService: gh<_i8.FirestoreProviderI>()));
    gh.factory<_i11.SettingsStorage>(() => _i11.SettingsStorage());
    gh.factory<_i12.SignUpBloc>(
        () => _i12.SignUpBloc(authService: gh<_i5.FbAuthApiI>()));
    gh.factory<_i13.UserPageBloc>(
        () => _i13.UserPageBloc(gh<_i5.FbAuthApiI>()));
    gh.lazySingleton<_i14.WordDetailsApiI>(() => _i14.WordDetailsApi());
    gh.lazySingleton<_i15.WordDetailsRepository>(
        () => _i15.WordDetailsRepository());
    gh.lazySingleton<_i16.WordTranslateApiI>(() => _i16.WordTranslateApi());
    gh.lazySingleton<_i17.WordTranslateRepository>(
        () => _i17.WordTranslateRepository());
    gh.lazySingleton<_i18.AuthRepositoryI>(
        () => _i18.AuthRepository(fbAuthApi: gh<_i5.FbAuthApiI>()));
    gh.factory<_i19.SettingsBloc>(
        () => _i19.SettingsBloc(authRepository: gh<_i18.AuthRepositoryI>()));
    gh.factory<_i20.WordDetailsBloc>(
        () => _i20.WordDetailsBloc(gh<_i15.WordDetailsRepository>()));
    gh.factory<_i21.WordLoadBloc>(
        () => _i21.WordLoadBloc(gh<_i17.WordTranslateRepository>()));
    return this;
  }
}
