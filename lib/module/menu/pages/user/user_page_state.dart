part of 'user_page_bloc.dart';

enum StatusUser { neutral, loggedIn, loggedOut }

class UserPageState extends Equatable {
  const UserPageState(
      {required this.userName, required this.email, this.user, required this.status});

  final UserModel? user;
  final String userName;
  final String email;
  final StatusUser status;

  UserPageState copyWith({String? userName, String? email, status}) {
    return UserPageState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      status: status,
    );
  }

  @override
  List<Object?> get props => [userName, email, status];
}
