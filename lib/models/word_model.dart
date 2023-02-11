import 'package:equatable/equatable.dart';

class WordModel extends Equatable {
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
    const WordModel(word: 'implement', translate: 'выполнять'),
    const WordModel(word: 'inset', translate: 'вставка'),
    const WordModel(word: 'submit', translate: 'утверждать'),
    const WordModel(word: 'performance', translate: 'производительность'),
    const WordModel(word: 'quiz', translate: 'опрос'),
    const WordModel(word: 'indeed', translate: 'верно'),
   
  ];
}
