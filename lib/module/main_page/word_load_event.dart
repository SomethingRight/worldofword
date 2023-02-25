part of 'word_load_bloc.dart';

abstract class WordLoadEvent extends Equatable {
  const WordLoadEvent();

  @override
  List<Object> get props => [];
}

class WordLoading extends WordLoadEvent{
  final String word;

  const WordLoading(this.word);

  @override
  List<Object> get props => [word];
}

