import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/auth/firebase_auth_api.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';


@Injectable()
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FbAuthApiI _authService;
  SignUpBloc({
    required FbAuthApiI authService,
  })  : _authService = authService,
        super(const SignUpState(email: '',password: '', userName: '')) {
    on<ConfirmSignUpEvent>((event, emit) async {
      try {
        await _authService.signUpWithEmail(
            email: state.email,
            password: state.password,
            name: state.userName);
        emit(state.copyWith(status: SignupStatus.success));
      } catch (e) {
        emit(state.copyWith(status: SignupStatus.failure));
      } 
    });
    on<ChangeNameEvent>((event, emit) {
      emit(state.copyWith(userName: event.name));
    });
    on<ChangeEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<ChangePassEvent>((event, emit) {
      emit(state.copyWith(password: event.pass));
    });
  }
}
