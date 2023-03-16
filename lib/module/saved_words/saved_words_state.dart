// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'saved_words_bloc.dart';

abstract class SavedWordsState extends Equatable {
  const SavedWordsState();

  @override
  List<Object?> get props => [];
}

class SavedWordsEmpty extends SavedWordsState {
}

class SavedWordsLoading extends SavedWordsState {}

class SavedWordsLoaded extends SavedWordsState {
  const SavedWordsLoaded({this.savedList});

  final  UnmodifiableListView<WordTranslateModel>? savedList;

  @override
  List<Object?> get props => [savedList];
}
