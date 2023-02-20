

import 'package:equatable/equatable.dart';
import 'package:worldofword/models/word_translate_model.dart';

class SavedList extends Equatable {
  final List<WordTranslateModel> wordsList;

  const SavedList({this.wordsList = const <WordTranslateModel>[]});

  @override
  List<Object?> get props => [wordsList];
}