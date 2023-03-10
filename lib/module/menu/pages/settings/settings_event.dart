part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends SettingsEvent {
  const ThemeChanged({required this.theme});
  final AppTheme theme;

  @override
  List<Object> get props => [theme];
}

class FontSizeChanged extends SettingsEvent {
  const FontSizeChanged({required this.fontSize});
  final double fontSize;

  @override
  List<Object> get props => [fontSize];
}

class LocaleChanged extends SettingsEvent {
  const LocaleChanged({required this.locale});
  final Locale locale;

  @override
  List<Object> get props => [locale];
}
