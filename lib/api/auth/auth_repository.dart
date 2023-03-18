// ignore_for_file: prefer_conditional_assignment

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
}

abstract class AuthRepositoryI {
  Stream<AppStateBase> getStateListener();
}
