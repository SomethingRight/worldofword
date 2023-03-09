import 'package:equatable/equatable.dart';

class WordDetailsModel extends Equatable {
  const WordDetailsModel(
      {this.word,
      this.translate,
      this.phoneticSpelling,
      this.definitions,
      this.lexicalCategory,
      this.audioPath,
      this.phrases,
      this.synonims});

  factory WordDetailsModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? finalPhrases;
    List<dynamic>? syn;
    List<dynamic>? syn2;
    Map<String, dynamic>? syn3;
    if (json['entries'][0]['senses'][0]['synonyms'] != null) {
      syn = json['entries'][0]['senses'][0]['synonyms'];
    }
    if (json['entries'][0]['senses'][0]['synonyms'] == null &&
        json['entries'][0]['senses'][0]['subsenses'] != null) {
      syn2 = json['entries'][0]['senses'][0]['subsenses'];
      syn3 = syn2?.firstWhere((element) => element['synonyms'] != null);
    } else if (json['phrases'] != null) {
      finalPhrases = json['phrases'];
    }
    if (json['phrases'] == null) {
      finalPhrases = json['entries'][0]['senses'][0]['examples'];
    }
    return WordDetailsModel(
        word: json['text'] as String?,
        phoneticSpelling: json['entries'][0]['pronunciations'][0]
            ['phoneticSpelling'] as String?,
        definitions:
            json['entries'][0]['senses'][0]['definitions'][0] as String?,
        lexicalCategory: json['lexicalCategory']['id'] as String?,
        audioPath:
            json['entries'][0]['pronunciations'][1]['audioFile'] as String?,
        phrases: finalPhrases,
        synonims: syn ?? syn3?['synonyms']);
  }

  final String? word;
  final String? phoneticSpelling;
  final String? translate;
  final String? definitions;
  final String? lexicalCategory;
  final String? audioPath;
  final List<dynamic>? phrases;
  final List<dynamic>? synonims;

  @override
  List<Object?> get props => [
        word,
        translate,
        phoneticSpelling,
        definitions,
        lexicalCategory,
        audioPath,
        phrases,
        synonims
      ];
}
