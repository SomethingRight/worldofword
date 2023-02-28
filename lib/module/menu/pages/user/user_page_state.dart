part of 'user_page_bloc.dart';

class UserPageState extends Equatable {
  const UserPageState({this.user});

  final User? user;

  @override
  List<Object?> get props => [user];
}
