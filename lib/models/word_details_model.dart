import 'package:equatable/equatable.dart';

class WordDetailsModel extends Equatable {
  const WordDetailsModel(
      {this.word,
      this.translate,
      this.phoneticSpelling,
      this.definitions,
      this.lexicalCategory});

  factory WordDetailsModel.fromJson(Map<String, dynamic> json) => WordDetailsModel(
      word: json['text'] as String?,
      phoneticSpelling: json['entries'][0]['pronunciations'][0]
          ['phoneticSpelling'] as String?,
      definitions: json['entries'][0]['senses'][0]['definitions'][0] as String?,
      lexicalCategory: json['lexicalCategory']['id'] as String?);

  final String? word;
  final String? phoneticSpelling;
  final String? translate;
  final String? definitions;
  final String? lexicalCategory;

  @override
  List<Object?> get props =>
      [word, translate, phoneticSpelling, definitions, lexicalCategory];

  static final List<WordDetailsModel> words = [
    const WordDetailsModel(word: 'dictionary', lexicalCategory: 'noun'),
    const WordDetailsModel(word: 'swatch', lexicalCategory: 'noun'),
    const WordDetailsModel(word: 'parse', lexicalCategory: 'verb')
  ];
}
