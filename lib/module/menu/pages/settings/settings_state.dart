part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.theme, required this.fontSize});

  final AppTheme theme;
  final double fontSize;

  SettingsState copyWith({AppTheme? theme, double? fontSize}) {
    return SettingsState(
        theme: theme ?? this.theme, fontSize: fontSize ?? this.fontSize);
  }

  @override
  List<Object> get props => [theme, fontSize];
}
