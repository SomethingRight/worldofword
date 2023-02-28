import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({this.uid, this.email, this.name});

  final String? uid;
  final String? email;
  final String? name;
  
  static const empty = UserModel(uid: '');

  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [uid, email, name]; 
}

