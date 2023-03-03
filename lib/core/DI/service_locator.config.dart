// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:worldofword/api/auth/firebase_auth_api.dart' as _i4;
import 'package:worldofword/api/auth/firebase_provider.dart' as _i6;
import 'package:worldofword/api/exception/exception_handler.dart' as _i3;
import 'package:worldofword/api/firestore/firestore_provider.dart' as _i7;
import 'package:worldofword/api/word_api/word_details/word_details_api.dart'
    as _i12;
import 'package:worldofword/api/word_api/word_details/word_details_repository.dart'
    as _i13;
import 'package:worldofword/api/word_api/word_traslate/word_translate_api.dart'
    as _i14;
import 'package:worldofword/api/word_api/word_traslate/word_translate_repository.dart'
    as _i15;
import 'package:worldofword/core/navigation/router.dart' as _i8;
import 'package:worldofword/module/auth/email_pass_auth/firebase_auth_bloc.dart'
    as _i5;
import 'package:worldofword/module/auth/sign_up_auth/sign_up_bloc.dart' as _i10;
import 'package:worldofword/module/main_page/word_load_bloc.dart' as _i17;
import 'package:worldofword/module/menu/pages/user/user_page_bloc.dart' as _i11;
import 'package:worldofword/module/saved_words/saved_words_bloc.dart' as _i9;
import 'package:worldofword/module/word_details_page/word_details_bloc.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

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
    gh.lazySingleton<_i3.ExceptionHandlerI>(() => _i3.ExceptionHandler());
    gh.factory<_i4.FbAuthApiI>(() => _i4.FirebaseAuthApi(
        fbLoginExceptionConverter: gh<_i3.ExceptionHandlerI>()));
    gh.factory<_i5.FirebaseAuthBloc>(
        () => _i5.FirebaseAuthBloc(authService: gh<_i4.FbAuthApiI>()));
    gh.lazySingleton<_i6.FirebaseProviderI>(() => _i6.FirebaseProvider());
    gh.factory<_i7.FirestoreProviderI>(() => _i7.FirestoreProvider());
    gh.singleton<_i8.RouterI>(_i8.Router());
    gh.factory<_i9.SavedWordsBloc>(() =>
        _i9.SavedWordsBloc(firestoreService: gh<_i7.FirestoreProviderI>()));
    gh.factory<_i10.SignUpBloc>(
        () => _i10.SignUpBloc(authService: gh<_i4.FbAuthApiI>()));
    gh.factory<_i11.UserPageBloc>(
        () => _i11.UserPageBloc(gh<_i4.FbAuthApiI>()));
    gh.lazySingleton<_i12.WordDetailsApiI>(() => _i12.WordDetailsApi());
    gh.lazySingleton<_i13.WordDetailsRepository>(
        () => _i13.WordDetailsRepository());
    gh.lazySingleton<_i14.WordTranslateApiI>(() => _i14.WordTranslateApi());
    gh.lazySingleton<_i15.WordTranslateRepository>(
        () => _i15.WordTranslateRepository());
    gh.factory<_i16.WordDetailsBloc>(
        () => _i16.WordDetailsBloc(gh<_i13.WordDetailsRepository>()));
    gh.factory<_i17.WordLoadBloc>(
        () => _i17.WordLoadBloc(gh<_i15.WordTranslateRepository>()));
    return this;
  }
}
