// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:worldofword/api/auth/firebase_auth_api.dart' as _i3;
import 'package:worldofword/api/auth/firebase_provider.dart' as _i5;
import 'package:worldofword/api/word_api/word_traslate/word_translate_api.dart'
    as _i9;
import 'package:worldofword/api/word_api/word_traslate/word_translate_repository.dart'
    as _i10;
import 'package:worldofword/core/navigation/router.dart' as _i6;
import 'package:worldofword/module/auth/email_pass_auth/firebase_auth_bloc.dart'
    as _i4;
import 'package:worldofword/module/auth/sign_up_auth/sign_up_bloc.dart' as _i8;
import 'package:worldofword/module/main_page/word_load_bloc.dart' as _i11;
import 'package:worldofword/module/saved_words/bloc/saved_words_bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i3.FbAuthApiI>(() => _i3.FirebaseAuthApi());
    gh.factory<_i4.FirebaseAuthBloc>(
        () => _i4.FirebaseAuthBloc(authService: gh<_i3.FbAuthApiI>()));
    gh.lazySingleton<_i5.FirebaseProviderI>(() => _i5.FirebaseProvider());
    gh.singleton<_i6.RouterI>(_i6.Router());
    gh.factory<_i7.SavedWordsBloc>(() => _i7.SavedWordsBloc());
    gh.factory<_i8.SignUpBloc>(
        () => _i8.SignUpBloc(authService: gh<_i3.FbAuthApiI>()));
    gh.lazySingleton<_i9.WordTranslateApiI>(() => _i9.WordTranslateApi());
    gh.lazySingleton<_i10.WordTranslateRepository>(
        () => _i10.WordTranslateRepository());
    gh.factory<_i11.WordLoadBloc>(
        () => _i11.WordLoadBloc(gh<_i10.WordTranslateRepository>()));
    return this;
  }
}
