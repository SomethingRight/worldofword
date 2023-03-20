import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/auth/auth_repository.dart';
import 'package:worldofword/core/settings/settings_storage.dart';
import 'package:worldofword/core/settings/theme.dart';
import 'package:worldofword/models/app_state.dart';

part 'main_event.dart';
part 'main_state.dart';

@Injectable()
class MainBloc extends Bloc<MainEvent, MainState> {
  final AuthRepositoryI authRepository;
  late StreamSubscription<AppStateBase> sub;
  MainBloc({required this.authRepository})
      : super(MainState(
            authState: UnknownState(),
            fontSize: Variables.fontSize,
            theme: Variables.initialTheme,
            locale: Variables.locale)) {
    sub = authRepository.getStateListener().listen((authState) {
      debugPrint('@@@ authState is : $authState');
      add(LoginStateChange(authState: authState));
    });
    on<LoginStateChange>((event, emit) {
      emit(state.copyWith(authState: event.authState));
    });
    on<ThemeChange>((event, emit) {
      SettingsStorage.setTheme(ThemeEnam().themeColorFromEnum(event.theme));
      emit(state.copyWith(theme: event.theme));
    });
    on<FontSizeChange>((event, emit) {
      SettingsStorage.setFontSize(event.fontSize);
      emit(state.copyWith(fontSize: event.fontSize));
    });
    on<LocaleChange>((event, emit) {
      SettingsStorage.setLocale(event.locale.languageCode);
      emit(state.copyWith(locale: event.locale));
    });
  }
}
