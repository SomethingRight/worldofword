part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState(
      {required this.theme,
      required this.fontSize,
      required this.locale,
      required this.authState});

  final AppTheme theme;
  final double fontSize;
  final Locale locale;
  final AppStateBase authState;

  SettingsState copyWith(
      {AppTheme? theme,
      double? fontSize,
      Locale? locale,
      AppStateBase? authState}) {
    return SettingsState(
        authState: authState ?? this.authState,
        locale: locale ?? this.locale,
        theme: theme ?? this.theme,
        fontSize: fontSize ?? this.fontSize);
  }

  @override
  List<Object> get props => [theme, fontSize, locale, authState];
}
