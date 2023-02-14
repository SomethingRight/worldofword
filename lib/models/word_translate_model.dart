import 'package:equatable/equatable.dart';

class WordTranslateModel extends Equatable {
  const WordTranslateModel({
    this.word,
    this.translate,
  });

  factory WordTranslateModel.fromJson(Map<String, dynamic> json) => WordTranslateModel(
      word: json['text'] as String?,
      translate: json['entries'][0]['senses'][0]['translations'][0]['text']
          as String?);

  final String? word;
  final String? translate;

  @override
  List<Object?> get props => [word, translate];
}
