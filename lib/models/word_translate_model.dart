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

  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'translate': translate,
      'lexicalCategory': lexicalCategory,
    };
  }

  factory WordTranslateModel.fromMap(Map<String, dynamic> map) {
    return WordTranslateModel(
      word: map['word'] != null ? map['word'] as String : null,
      translate: map['translate'] != null ? map['translate'] as String : null,
      lexicalCategory: map['lexicalCategory'] != null ? map['lexicalCategory'] as String : null,
    );
  }

  final String? word;
  final String? translate;
  final String? lexicalCategory;

  @override
  List<Object?> get props => [word, translate, lexicalCategory];
}
