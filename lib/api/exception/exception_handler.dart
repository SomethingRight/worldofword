import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'app_exception.dart';
import 'auth_exception.dart';

@LazySingleton(as: ExceptionHandlerI)
class ExceptionHandler implements ExceptionHandlerI {
  @override
  AppException fromFirebaseAuthException(dynamic e, StackTrace stack) {
    debugPrint('@@@ $e');
    String? userMessage;
    String? code;
    if (e is FirebaseAuthException) {
      if (e.code == 'weak-password') {
        userMessage = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        userMessage = 'Email already in use';
      } else if (e.code == 'user-not-found') {
        // userMessage = 'No such user';
        userMessage = 'Please enter correct Email';
        //debugPrint('No user with this e-mail');
      } else if (e.code == 'invalid-email') {
        userMessage = 'Please enter correct Email';
        //debugPrint('Invalid e-mail');
      } else if (e.code == 'wrong-password') {
        userMessage = 'Please enter correct Password';
        //debugPrint('Wrong password');
      } else if (e.code == 'too-many-requests') {
        userMessage = 'Too many login requests';
        //debugPrint('Wrong password');
      } else if (e.code == 'account-exists-with-different-credential') {
        userMessage =
            'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.';
        //debugPrint('Wrong password');
      }
      code = e.code;
    } else if (e is AuthException) {
      if (e.reason == 'password_mismatch') {
        userMessage = 'Password mismatch';
        code = e.reason as String;
      }
    }
    return AppException(userMessage, code);
  }
}

abstract class ExceptionHandlerI {
  AppException fromFirebaseAuthException(dynamic e, StackTrace stack);
}
