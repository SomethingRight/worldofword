part of 'word_details_bloc.dart';

abstract class WordDetailsState extends Equatable {
  const WordDetailsState();
  
  @override
  List<Object> get props => [];
}

class WordDetailsEmpty extends WordDetailsState {}

class WordDetailsLoading extends WordDetailsState{}

class WordDetailsLoaded extends WordDetailsState{
 const WordDetailsLoaded({required this.wordDetails});

 final WordDetailsModel wordDetails;

   @override
  List<Object> get props => [wordDetails];
}