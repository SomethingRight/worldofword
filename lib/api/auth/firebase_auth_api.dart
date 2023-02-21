import 'package:firebase_auth/firebase_auth.dart';

abstract class FbAuthApiI {
  Future<UserCredential> signInEmail({
    required String? login,
    required String? password,
  });

  Future<User?> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  });

  User? getUserCredentials();

  Future<void> signOut();
}