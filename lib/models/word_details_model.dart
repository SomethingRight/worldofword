import 'package:equatable/equatable.dart';

class WordDetailsModel extends Equatable {
  const WordDetailsModel(
      {this.word,
      this.translate,
      this.phoneticSpelling,
      this.definitions,
      this.lexicalCategory,
      this.audioPath,
      this.phrases});

  factory WordDetailsModel.fromJson(Map<String, dynamic> json) => WordDetailsModel(
      word: json['text'] as String?,
      phoneticSpelling: json['entries'][0]['pronunciations'][0]
          ['phoneticSpelling'] as String?,
      definitions: json['entries'][0]['senses'][0]['definitions'][0] as String?,
      lexicalCategory: json['lexicalCategory']['id'] as String?,
      audioPath: json['entries'][0]['pronunciations'][1]['audioFile'] as String?,
      phrases: json['phrases'] as List<dynamic>?
      );

  final String? word;
  final String? phoneticSpelling;
  final String? translate;
  final String? definitions;
  final String? lexicalCategory;
  final String? audioPath;
  final List<dynamic>? phrases;

  @override
  List<Object?> get props =>
      [word, translate, phoneticSpelling, definitions, lexicalCategory, audioPath, phrases];

}
