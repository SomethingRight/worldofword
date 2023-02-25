import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/auth/firebase_auth_api.dart';

part 'firebase_auth_event.dart';
part 'firebase_auth_state.dart';


@Injectable()
class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  final FbAuthApiI _authService;
  FirebaseAuthBloc({required FbAuthApiI authService})
      : _authService = authService,
        super(const FirebaseAuthState(email: '', password: '')) {
    on<ChangeEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<ChangePassEvent>((event, emit) {
      emit(state.copyWith(password: event.pass));
    });
    on<ButtonLoginTapEvent>((event, emit) async {
      try {
       await  _authService.signInEmail(login: state.email, password: state.password);
       emit(state);
      } catch (e) {
       throw FirebaseAuthException(code: e.toString()); 
      }
      debugPrint('@@@ state is ${state.toString()}');
    });
  }
}
