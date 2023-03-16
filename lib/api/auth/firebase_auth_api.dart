import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/exception/exception_handler.dart';
import 'package:worldofword/module/widgets/snackbar_global.dart';

@Injectable(as: FbAuthApiI)
class FirebaseAuthApi implements FbAuthApiI {
  FirebaseAuthApi({required this.fbLoginExceptionConverter});

  final ExceptionHandlerI fbLoginExceptionConverter;

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
      user?.updateDisplayName(name);
      return user;
    } on FirebaseAuthException catch (e, stack) {
      SnackbarGlobal.show(
          message: fbLoginExceptionConverter
              .fromFirebaseAuthException(e, stack)
              .toString(),
          duration: 2000);
      throw fbLoginExceptionConverter.fromFirebaseAuthException(e, stack);
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = FirebaseAuth.instance.currentUser;
      return user;
    } on FirebaseException catch (e, stack) {
      throw fbLoginExceptionConverter.fromFirebaseAuthException(e, stack);
    }
  }

  @override
  Future<UserCredential> signInEmail(
      {required String? login, required String? password}) async {
    try {
      final auth = FirebaseAuth.instance;
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: login!, password: password!);
      debugPrint('@@@ user is: ${userCredential.user?.email}');
      return userCredential;
    } on FirebaseAuthException catch (e, stack) {
      SnackbarGlobal.show(
          message: fbLoginExceptionConverter
              .fromFirebaseAuthException(e, stack)
              .toString(),
          duration: 2000);
      throw fbLoginExceptionConverter.fromFirebaseAuthException(e, stack);
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

  Future<User?> signInWithGoogle();

  Future<UserCredential> signInEmail({
    required String? login,
    required String? password,
  });

  User? getUserCredentials();

  Future<void> signOut();
}
