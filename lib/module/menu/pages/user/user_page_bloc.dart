import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/auth/auth_repository.dart';
import 'package:worldofword/models/user_model.dart';

part 'user_page_event.dart';
part 'user_page_state.dart';

@Injectable()
class UserPageBloc extends Bloc<UserPageEvent, UserPageState> {
  final AuthRepositoryI authRepository;
  UserPageBloc({required this.authRepository})
      : super(const UserPageState(
            email: 'e-mail',
            userName: 'user name',
            status: StatusUser.neutral)) {
    on<SetUser>((event, emit) {
      emit(state.copyWith(
          email: event.email,
          userName: event.userName,
          status: StatusUser.loggedIn));
    });
    on<SignOut>((event, emit) async  {
      signOut();
      emit(state.copyWith(status: StatusUser.loggedOut));
    });
    setUser();
  }

  void setUser() {
    User? userData = authRepository.getUserCredentials();
    add(SetUser(
        email: userData!.email.toString(),
        userName: userData.displayName.toString()));
  }

  void signOut() {
    authRepository.signOut();
  }
}
