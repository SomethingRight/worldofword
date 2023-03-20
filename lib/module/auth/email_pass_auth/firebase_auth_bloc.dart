import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/auth/auth_repository.dart';

part 'firebase_auth_event.dart';
part 'firebase_auth_state.dart';

@Injectable()
class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  final AuthRepositoryI authRepository;
  FirebaseAuthBloc({required this.authRepository})
      : super(const FirebaseAuthState(
            status: StatusLogin.inProcess,
            email: '',
            password: '',
            errorMessage: '')) {
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
      emit(state.copyWith(
          status: StatusLogin.failure, errorMessage: state.errorMessage));
    });
    on<LoginWithGoogle>((event, emit) async {
      final user = await authRepository.signInWithGoogle();
      if (user != null) {
        emit(state.copyWith(status: StatusLogin.success, email: user.email));
      }
    });
  }

  void logIn({required String email, required String password}) async {
    authRepository.signInEmail(login: email, password: password).then((value) {
      add(LoginSuccessEvent());
    }, onError: (dynamic e) {
      add(LoginFailureEvent(errorMessage: e.toString()));
    });
  }
}
