part of 'firebase_auth_bloc.dart';

enum StatusLogin { inProcess, success, failure }

class FirebaseAuthState extends Equatable {
  const FirebaseAuthState({
    this.errorMessage,
    this.status = StatusLogin.inProcess,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
  final StatusLogin? status;
  final String? errorMessage;

  bool get isEmailCorrect => email.contains('@');
  bool get isPasswordCorrect => password.length >= 8;

  @override
  List<Object?> get props => [email, password, status, errorMessage];

  FirebaseAuthState copyWith({
    String? errorMessage,
    StatusLogin? status,
    String? email,
    String? password,
  }) {
    return FirebaseAuthState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
