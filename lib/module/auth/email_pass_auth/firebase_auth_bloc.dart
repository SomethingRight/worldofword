import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/auth/firebase_auth_api.dart';
import 'package:worldofword/core/navigation/router.dart';

part 'firebase_auth_event.dart';
part 'firebase_auth_state.dart';

@Injectable()
class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  final FbAuthApiI _authService;

  String? _emailError = '';
  String? _passError = '';
  String? _errorMessage = '';

  FirebaseAuthBloc({required FbAuthApiI authService})
      : _authService = authService,
        super(const FirebaseAuthState(
          status: StatusLogin.inProcess,
          email: '',
          password: '',
        )) {
    on<EmailErrorEvent>((event, emit) {
      _emailError = event.emailErrorText;

      emit(state.copyWith(
          emailErrorText: _emailError, passwordErrorText: _passError));
    });
    on<PasswordErrorEvent>((event, emit) {
      _passError = event.passwordErrorText;

      emit(state.copyWith(
          passwordErrorText: _passError, emailErrorText: _emailError));
    });
    on<ChangeEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<ChangePassEvent>((event, emit) {
      emit(state.copyWith(password: event.pass));
    });
    on<ButtonLoginTapEvent>((event, emit) async {
      logIn(email: state.email, password: state.password);
    });
    on<LoginSuccessEvent>((event, emit) async {
      emit(state.copyWith(status: StatusLogin.success));
    });
    on<LoginFailureEvent>((event, emit) async {
      _errorMessage = event.errorMessage;

      emit(state.copyWith(
          status: StatusLogin.failure, errorMessage: _errorMessage));
    });
  }

  void logIn({required String email, required String password}) {
    _authService.signInEmail(login: email, password: password).then((value) {
      add(LoginSuccessEvent());
    }, onError: (dynamic e) {
      add(LoginFailureEvent(errorMessage: e));
    });
  }
}
