import 'package:equatable/equatable.dart';

class WordTranslateModel extends Equatable {
  WordTranslateModel({this.word, this.translate, this.languageCode});

  // factory WordTranslateModel.fromJson(Map<String, dynamic> json) {
  //   String translate = '';
  //   if (json['entries'][0]['senses'][0]['translations'] != null) {
  //     translate = json['entries'][0]['senses'][0]['translations'][0]['text'];
  //   } else if (json['entries'][0]['senses'][0]['translations'] == null) {
  //     translate = 'notranslation';
  //   }
  //   return WordTranslateModel(
  //       word: json['text'] as String,
  //       lexicalCategory: json['lexicalCategory']['id'] as String,
  //       translate: translate);
  // }

  factory WordTranslateModel.fromJson(Map<String, dynamic> json) {
    return WordTranslateModel(
        //word: word as String,
        languageCode: json['detectedSourceLanguage'] as String,
        translate: json['translatedText'] as String);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'translatedText': translate,
      'detectedSourceLanguage': languageCode,
    };
  }

  factory WordTranslateModel.fromMap(Map<String, dynamic> map) {
    return WordTranslateModel(
      word: map['word'] != null ? map['word'] as String : null,
      translate: map['translatedText'] != null
          ? map['translatedText'] as String
          : null,
      languageCode: map['detectedSourceLanguage'] != null
          ? map['detectedSourceLanguage'] as String
          : null,
    );
  }

  String? word;
  final String? translate;
  final String? languageCode;

  @override
  List<Object?> get props => [translate, languageCode, word];
}
