part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class ThemeChange extends MainEvent {
  const ThemeChange({required this.theme});
  final AppTheme theme;

  @override
  List<Object> get props => [theme];
}

class FontSizeChange extends MainEvent {
  const FontSizeChange({required this.fontSize});
  final double fontSize;

  @override
  List<Object> get props => [fontSize];
}

class LocaleChange extends MainEvent {
  const LocaleChange({required this.locale});
  final Locale locale;

  @override
  List<Object> get props => [locale];
}

class LoginStateChange extends MainEvent {
  const LoginStateChange({required this.authState});

  final AppStateBase authState;

  @override
  List<Object> get props => [authState];
}
