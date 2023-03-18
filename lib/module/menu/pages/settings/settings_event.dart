part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ThemeChange extends SettingsEvent {
  const ThemeChange({required this.theme});
  final AppTheme theme;

  @override
  List<Object> get props => [theme];
}

class FontSizeChange extends SettingsEvent {
  const FontSizeChange({required this.fontSize});
  final double fontSize;

  @override
  List<Object> get props => [fontSize];
}

class LocaleChange extends SettingsEvent {
  const LocaleChange({required this.locale});
  final Locale locale;

  @override
  List<Object> get props => [locale];
}

class LoginStateChange extends SettingsEvent {
  const LoginStateChange({required this.authState});

  final AppStateBase authState;

  @override
  List<Object> get props => [authState];
}
