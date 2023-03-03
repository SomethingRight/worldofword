part of 'word_details_bloc.dart';

abstract class WordDetailsEvent extends Equatable {
  const WordDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadWordDetails extends WordDetailsEvent{
  const LoadWordDetails({required this.word});

  final String word;

  @override
  List<Object> get props => [word];
}
