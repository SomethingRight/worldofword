import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/auth/auth_repository.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

@Injectable()
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepositoryI authRepository;
  SignUpBloc({required this.authRepository})
      : super(const SignUpState(
            email: '',
            password: '',
            userName: '',
            status: SignupStatus.loading)) {
    on<ConfirmSignUpEvent>((event, emit) async {
      await authRepository.signUpWithEmail(
          email: state.email, password: state.password, name: state.userName);
      emit(state.copyWith(status: SignupStatus.success));
    });
    on<ChangeNameEvent>((event, emit) {
      emit(state.copyWith(userName: event.name, status: SignupStatus.loading));
    });
    on<ChangeEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email, status: SignupStatus.loading));
    });
    on<ChangePassEvent>((event, emit) {
      emit(state.copyWith(password: event.pass, status: SignupStatus.loading));
    });
  }
}
