part of 'user_page_bloc.dart';

abstract class UserPageEvent extends Equatable {
  const UserPageEvent();

  @override
  List<Object> get props => [];
}

class SetUser extends UserPageEvent {
  const SetUser({
    required this.userName,required  this.email, this.user});

  final UserModel? user;
  final String userName;
  final String email;

  @override
  List<Object> get props => [userName, email];
}

class SignOut extends UserPageEvent {}
