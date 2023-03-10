import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/core/settings/settings_storage.dart';
import 'package:worldofword/core/settings/theme.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@Injectable()
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(SettingsState(
            fontSize: Variables.fontSize,
            theme: Variables.initialTheme,
            locale: const Locale('en'))) {
    on<ThemeChanged>((event, emit) {
      SettingsStorage.setTheme(ThemeEnam().themeColorFromEnum(event.theme));
      emit(state.copyWith(theme: event.theme));
    });
    on<FontSizeChanged>((event, emit) {
      SettingsStorage.setFontSize(event.fontSize);
      emit(state.copyWith(fontSize: event.fontSize));
    });
    on<LocaleChanged>((event, emit) {
      emit(state.copyWith(locale: event.locale));
    });
  }
}
