part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class ConfirmSignUpEvent extends SignUpEvent {
  const ConfirmSignUpEvent();

  @override
  List<Object> get props => [];
}

class ChangeEmailEvent extends SignUpEvent {
  const ChangeEmailEvent({required this.email});
  final String email;

  @override
  List<Object> get props => [email];
}

class ChangePassEvent extends SignUpEvent {
  const ChangePassEvent({required this.pass});
  final String pass;

  @override
  List<Object> get props => [pass];
}

class ChangeNameEvent extends SignUpEvent {
  const ChangeNameEvent({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class NameErrorEvent extends SignUpEvent {
  const NameErrorEvent(this.nameErrorText);

  final String? nameErrorText;

  @override
  List<Object?> get props => [nameErrorText];
}

class EmailErrorEvent extends SignUpEvent {
  const EmailErrorEvent({
    this.emailErrorText,
  });

  final String? emailErrorText;

  @override
  List<Object?> get props => [
        emailErrorText,
      ];
}

class PasswordErrorEvent extends SignUpEvent {
  const PasswordErrorEvent({this.passwordErrorText});

  final String? passwordErrorText;

  @override
  List<Object?> get props => [passwordErrorText];
}

