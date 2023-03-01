part of 'saved_words_bloc.dart';

abstract class SavedWordsState extends Equatable {
  const SavedWordsState();
  
  @override
  List<Object> get props => [];
}

class SavedWordsLoading extends SavedWordsState {}

class SavedWordsLoaded extends SavedWordsState {
  const SavedWordsLoaded({this.savedList = const SavedList()});

  final SavedList savedList;

  @override
  List<Object> get props => [savedList];
}

class SavedWordsError extends SavedWordsState {}