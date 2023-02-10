

import 'package:equatable/equatable.dart';

class WordModel extends Equatable{
  const WordModel({required this.word, required this.translate});

  final String word;
  final String translate;
  
  @override
  List<Object?> get props => throw [word, translate];

  static final List<WordModel> words = [
    const WordModel(word: 'dictionary', translate: 'словарь'),
    const WordModel(word: 'swatch', translate: 'образец'),
    const WordModel(word: 'parse', translate: 'разбор'),
    const WordModel(word: 'hint', translate: 'подсказка'),
    const WordModel(word: 'consumer', translate: 'потребитель')
  ];
}