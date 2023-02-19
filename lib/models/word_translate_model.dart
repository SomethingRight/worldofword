import 'package:equatable/equatable.dart';

class WordTranslateModel extends Equatable {
  const WordTranslateModel({this.word, this.translate, this.lexicalCategory});

  factory WordTranslateModel.fromJson(Map<String, dynamic> json) {
    String translate = '';
    if (json['entries'][0]['senses'][0]['translations'] != null) {
      translate = json['entries'][0]['senses'][0]['translations'][0]['text'];
    } else if (json['entries'][0]['senses'][0]['translations'] == null) {
      translate = 'notranslation';
    }
    return WordTranslateModel(
        word: json['text'] as String,
        lexicalCategory: json['lexicalCategory']['id'] as String,
        translate: translate);
  }

  final String? word;
  final String? translate;
  final String? lexicalCategory;

  @override
  List<Object?> get props => [word, translate, lexicalCategory];
}
