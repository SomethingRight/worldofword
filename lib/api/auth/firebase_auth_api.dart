import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/exception/exception_handler.dart';


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
      throw fbLoginExceptionConverter.fromFirebaseAuthException(e, stack);
    }
  }

  @override
  Future<UserCredential> signInEmail(
      {required String? login, required String? password}) async {
    try {
      final _auth = FirebaseAuth.instance;
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: login!, password: password!);
          debugPrint('@@@ user is: ${userCredential.user?.email}');
      return userCredential;
    } on FirebaseAuthException catch(e,stack) {
      log(fbLoginExceptionConverter.fromFirebaseAuthException(e, stack).toString());
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

  Future<UserCredential> signInEmail({
    required String? login,
    required String? password,
  });

  User? getUserCredentials();

  Future<void> signOut();
}
