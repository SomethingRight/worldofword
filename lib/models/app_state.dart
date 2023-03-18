import 'package:equatable/equatable.dart';

abstract class AppStateBase extends Equatable {}

class UnknownState extends AppStateBase {
  @override
  List<Object?> get props => [];
}

class LoginState extends AppStateBase {
  @override
  List<Object?> get props => [];
}

class UnloginState extends AppStateBase {
  @override
  List<Object?> get props => [];
}
