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
        super(const SignUpState(
            email: '',
            password: '',
            userName: '',
            status: SignupStatus.loading)) {
    on<ConfirmSignUpEvent>((event, emit) async {
      await _authService.signUpWithEmail(
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
