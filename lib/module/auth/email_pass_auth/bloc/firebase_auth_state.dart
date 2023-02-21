part of 'firebase_auth_bloc.dart';

abstract class FirebaseAuthState extends Equatable {
  const FirebaseAuthState();
  
  @override
  List<Object> get props => [];
}

class FirebaseAuthInitial extends FirebaseAuthState {}
