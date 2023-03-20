part of 'main_bloc.dart';

class MainState extends Equatable {
  const MainState(
      {required this.theme,
      required this.fontSize,
      required this.locale,
      required this.authState});

  final AppTheme theme;
  final double fontSize;
  final Locale locale;
  final AppStateBase authState;

  MainState copyWith(
      {AppTheme? theme,
      double? fontSize,
      Locale? locale,
      AppStateBase? authState}) {
    return MainState(
        authState: authState ?? this.authState,
        locale: locale ?? this.locale,
        theme: theme ?? this.theme,
        fontSize: fontSize ?? this.fontSize);
  }

  @override
  List<Object> get props => [theme, fontSize, locale, authState];
}
