part of 'user_page_bloc.dart';

abstract class UserPageEvent extends Equatable {
  const UserPageEvent();

  @override
  List<Object> get props => [];
}

class SetUser extends UserPageEvent{
  const SetUser({required this.user});

  final User user;

  @override
  List<Object> get props => [user];
}

class RemoveUser extends UserPageEvent{}