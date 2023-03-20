// ignore_for_file: prefer_conditional_assignment

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:worldofword/api/auth/firebase_auth_api.dart';

import '../../models/app_state.dart';

@LazySingleton(as: AuthRepositoryI)
class AuthRepository implements AuthRepositoryI {
  AuthRepository({required this.fbAuthApi});
  final FbAuthApiI fbAuthApi;

  BehaviorSubject<AppStateBase>? appStateStream;
  @override
  Stream<AppStateBase> getStateListener() {
    if (appStateStream == null) {
      appStateStream = BehaviorSubject<AppStateBase>.seeded(UnknownState());
      final Stream<AppStateBase> stateStream = fbAuthApi
          .getStateListener()
          .startWith(fbAuthApi.getUserCredentials())
          .asyncMap((user) async {
        if (user == null) {
          return UnloginState();
        } else {
          return LoginState();
        }
      });

      stateStream.listen((event) {
        appStateStream?.add(event);
      });
    }
    return appStateStream!;
  }

  @override
  User? getUserCredentials() {
    final User? user = fbAuthApi.getUserCredentials();
    return user;
  }

  @override
  Future<UserCredential> signInEmail(
      {required String login, required String password}) async {
    final UserCredential user =
        await fbAuthApi.signInEmail(login: login, password: password);
    return user;
  }

  @override
  Future<User?> signInWithGoogle() async {
    final User? user = await fbAuthApi.signInWithGoogle();
    return user;
  }

  @override
  Future<void> signOut() async {
    await fbAuthApi.signOut();
  }

  @override
  Future<User?> signUpWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    final User? user = await fbAuthApi.signUpWithEmail(
        email: email, password: password, name: name);
    return user;
  }
}

abstract class AuthRepositoryI {
  Stream<AppStateBase> getStateListener();
  Future<User?> signUpWithEmail(
      {required String email, required String password, required String name});
  Future<UserCredential> signInEmail(
      {required String login, required String password});
  Future<User?> signInWithGoogle();
  User? getUserCredentials();
  Future<void> signOut();
}
