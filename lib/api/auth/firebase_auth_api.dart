import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: FbAuthApiI)
class FirebaseAuthApi implements FbAuthApiI {
  @override
  Future<User?> signUpWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      debugPrint('@@@ name=$name');

      final User? user = FirebaseAuth.instance.currentUser;
      return user;
    } catch (e) {
      throw FirebaseAuthException(code: e.toString());
    }
  }

  @override
  Future<UserCredential> signInEmail(
      {required String? login, required String? password}) async {
    try {
      final _auth = FirebaseAuth.instance;
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: login!, password: password!);
          debugPrint('@@@ user is: ${userCredential.user!.uid}');
      return userCredential;
    } catch (e) {
      throw FirebaseAuthException(code: e.toString());
    }
  }

  @override
  User? getUserCredentials() {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future<void> signOut() async {
    debugPrint('@@@ AuthApiI signOut');
    await FirebaseAuth.instance.signOut();
  }
}

abstract class FbAuthApiI {
  Future<User?> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  });

  Future<UserCredential> signInEmail({
    required String? login,
    required String? password,
  });

  User? getUserCredentials();

  Future<void> signOut();
}
