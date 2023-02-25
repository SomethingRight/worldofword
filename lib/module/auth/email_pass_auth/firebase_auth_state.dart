part of 'firebase_auth_bloc.dart';

class FirebaseAuthState extends Equatable {
  const FirebaseAuthState({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  bool get isValidEmail => email.contains('@');
  bool get isValidPassword => password.length >= 8;

  @override
  List<Object?> get props => [email, password];

  FirebaseAuthState copyWith({
    String? email,
    String? password,
  }) {
    return FirebaseAuthState(
        email: email ?? this.email, password: password ?? this.password);
  }
}
