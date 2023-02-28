part of 'user_page_bloc.dart';

class UserPageState extends Equatable {
  const UserPageState({required this.userName, required this.email, this.user});

  final UserModel? user;
  final String userName;
  final String email;

  UserPageState copyWith({String? userName, String? email}) {
    return UserPageState(
        userName: userName ?? this.userName, email: email ?? this.email);
  }

  @override
  List<Object?> get props => [userName, email];
}
