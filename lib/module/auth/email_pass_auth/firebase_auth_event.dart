part of 'firebase_auth_bloc.dart';

abstract class FirebaseAuthEvent extends Equatable {
  const FirebaseAuthEvent();

  @override
  List<Object?> get props => [];
}

class ButtonLoginTapEvent extends FirebaseAuthEvent {
  @override
  List<Object> get props => [];
}

class ChangeEmailEvent extends FirebaseAuthEvent {
  const ChangeEmailEvent({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class ChangePassEvent extends FirebaseAuthEvent {
  const ChangePassEvent({required this.pass});

  final String pass;

  @override
  List<Object> get props => [pass];
}


class LoginSuccessEvent extends FirebaseAuthEvent {}

class LoginFailureEvent extends FirebaseAuthEvent {
  const LoginFailureEvent({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

class LoginWithGoogle extends FirebaseAuthEvent {}
