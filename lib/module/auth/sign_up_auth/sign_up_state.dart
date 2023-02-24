// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

enum SignupStatus { success, failure, loading }

class SignUpState extends Equatable {
  const SignUpState(
      {required this.userName,
      required this.email,
      required this.password,
      this.status});

  final String userName;
  bool get isValidUsername => userName.length >= 5;
  final String email;
  final String password;
  bool get isValidPassword => password.length >= 8;
  final SignupStatus? status;

  @override
  List<Object?> get props => [userName, email, password, status];

  SignUpState copyWith(
      {String? userName,
      String? email,
      String? password,
      SignupStatus? status}) {
    return SignUpState(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status);
  }
}
