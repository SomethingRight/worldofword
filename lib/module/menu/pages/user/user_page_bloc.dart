import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/models/user_model.dart';

import '../../../../api/auth/firebase_auth_api.dart';

part 'user_page_event.dart';
part 'user_page_state.dart';

@Injectable()
class UserPageBloc extends Bloc<UserPageEvent, UserPageState> {
  UserPageBloc(this.fbAuthApi)
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
    on<SignOut>((event, emit) {
      signOut();
      emit(state.copyWith(status: StatusUser.loggedOut));
    });
  }

  final FbAuthApiI fbAuthApi;
  void setUser() {
    User? userData = fbAuthApi.getUserCredentials();
    add(SetUser(
        email: userData!.email.toString(),
        userName: userData.displayName.toString()));
  }

  void signOut() {
    fbAuthApi.signOut();
  }
}
