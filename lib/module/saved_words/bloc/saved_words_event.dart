part of 'saved_words_bloc.dart';

abstract class SavedWordsEvent extends Equatable {
  const SavedWordsEvent();

  @override
  List<Object> get props => [];
}

class StartSavedList extends SavedWordsEvent {}

class AddToSavedList extends SavedWordsEvent {
  const AddToSavedList({required this.word});

  final WordDetailsModel word;

  @override
  List<Object> get props => [word];
}

class RemoveFromSavedList extends SavedWordsEvent {
  const RemoveFromSavedList({required this.word});

  final WordDetailsModel word;

  @override
  List<Object> get props => [word];
}