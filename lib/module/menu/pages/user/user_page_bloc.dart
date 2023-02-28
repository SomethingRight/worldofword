import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/auth/firebase_auth_api.dart';

import '../../../../models/user_model.dart';

part 'user_page_event.dart';
part 'user_page_state.dart';

@Injectable()
class UserPageBloc extends Bloc<UserPageEvent, UserPageState> {
  UserPageBloc(this.fbAuthApi) : super(const UserPageState()) {
    on<SetUser>((event, emit) {
      setUser();
      emit(UserPageState(user: event.user));
      
    });
  }

  final FirebaseAuthApi fbAuthApi;
  void setUser(){
    User userData = fbAuthApi.getUserCredentials() as User;
    add(SetUser(user: userData));
  }
}
