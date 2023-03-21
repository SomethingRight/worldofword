part of 'word_load_bloc.dart';

abstract class WordLoadState extends Equatable {
  const WordLoadState();

  @override
  List<Object> get props => [];
}

class WordEmptyState extends WordLoadState {}

class WordLoadingState extends WordLoadState {}

class WordLoadedState extends WordLoadState {
  const WordLoadedState({required this.word});

  final WordTranslateModel word;

  @override
  List<Object> get props => [word];
}

class WordError extends WordLoadState {
  final String error;

  const WordError(this.error);
}
