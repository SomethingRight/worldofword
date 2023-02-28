import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({this.uid, this.email, this.name});

  final String? uid;
  final String? email;
  final String? name;
  
  static const empty = User(uid: '');

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [uid, email, name]; 
}

