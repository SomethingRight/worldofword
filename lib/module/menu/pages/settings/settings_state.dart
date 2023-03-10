part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState(
      {required this.theme, required this.fontSize, required this.locale});

  final AppTheme theme;
  final double fontSize;
  final Locale locale;

  SettingsState copyWith({AppTheme? theme, double? fontSize, Locale? locale}) {
    return SettingsState(
        locale: locale ?? this.locale,
        theme: theme ?? this.theme,
        fontSize: fontSize ?? this.fontSize);
  }

  @override
  List<Object> get props => [theme, fontSize, locale];
}
