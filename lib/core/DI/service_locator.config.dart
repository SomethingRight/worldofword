// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:worldofword/api/auth/auth_repository.dart' as _i15;
import 'package:worldofword/api/auth/firebase_auth_api.dart' as _i5;
import 'package:worldofword/api/auth/firebase_provider.dart' as _i6;
import 'package:worldofword/api/exception/exception_handler.dart' as _i4;
import 'package:worldofword/api/firestore/firestore_provider.dart' as _i7;
import 'package:worldofword/api/word_api/word_details/word_details_api.dart'
    as _i11;
import 'package:worldofword/api/word_api/word_details/word_details_repository.dart'
    as _i12;
import 'package:worldofword/api/word_api/word_traslate/word_translate_api.dart'
    as _i13;
import 'package:worldofword/api/word_api/word_traslate/word_translate_repository.dart'
    as _i14;
import 'package:worldofword/core/navigation/context_provider.dart' as _i3;
import 'package:worldofword/core/navigation/router.dart' as _i8;
import 'package:worldofword/core/settings/settings_storage.dart' as _i10;
import 'package:worldofword/main_bloc/main_bloc.dart' as _i17;
import 'package:worldofword/module/auth/email_pass_auth/firebase_auth_bloc.dart'
    as _i16;
import 'package:worldofword/module/auth/sign_up_auth/sign_up_bloc.dart' as _i18;
import 'package:worldofword/module/main_page/word_load_bloc.dart' as _i21;
import 'package:worldofword/module/menu/pages/user/user_page_bloc.dart' as _i19;
import 'package:worldofword/module/saved_words/saved_words_bloc.dart' as _i9;
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
    gh.lazySingleton<_i6.FirebaseProviderI>(() => _i6.FirebaseProvider());
    gh.factory<_i7.FirestoreProviderI>(() => _i7.FirestoreProvider());
    gh.singleton<_i8.RouterI>(
        _i8.Router(contextProvider: gh<_i3.ContextProviderI>()));
    gh.factory<_i9.SavedWordsBloc>(() =>
        _i9.SavedWordsBloc(firestoreService: gh<_i7.FirestoreProviderI>()));
    gh.factory<_i10.SettingsStorage>(() => _i10.SettingsStorage());
    gh.lazySingleton<_i11.WordDetailsApiI>(() => _i11.WordDetailsApi());
    gh.lazySingleton<_i12.WordDetailsRepositoryI>(() =>
        _i12.WordDetailsRepository(wordDetailsApi: gh<_i11.WordDetailsApiI>()));
    gh.lazySingleton<_i13.WordTranslateApiI>(() => _i13.WordTranslateApi());
    gh.lazySingleton<_i14.WordTranslateRepositoryI>(() =>
        _i14.WordTranslateRepository(
            wordTranslateApi: gh<_i13.WordTranslateApiI>()));
    gh.lazySingleton<_i15.AuthRepositoryI>(
        () => _i15.AuthRepository(fbAuthApi: gh<_i5.FbAuthApiI>()));
    gh.factory<_i16.FirebaseAuthBloc>(() =>
        _i16.FirebaseAuthBloc(authRepository: gh<_i15.AuthRepositoryI>()));
    gh.factory<_i17.MainBloc>(
        () => _i17.MainBloc(authRepository: gh<_i15.AuthRepositoryI>()));
    gh.factory<_i18.SignUpBloc>(
        () => _i18.SignUpBloc(authRepository: gh<_i15.AuthRepositoryI>()));
    gh.factory<_i19.UserPageBloc>(
        () => _i19.UserPageBloc(authRepository: gh<_i15.AuthRepositoryI>()));
    gh.factory<_i20.WordDetailsBloc>(
        () => _i20.WordDetailsBloc(gh<_i12.WordDetailsRepositoryI>()));
    gh.factory<_i21.WordLoadBloc>(
        () => _i21.WordLoadBloc(gh<_i14.WordTranslateRepositoryI>()));
    return this;
  }
}
