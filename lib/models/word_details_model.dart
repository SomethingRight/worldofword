// ignore_for_file: unrelated_type_equality_checks

import 'package:equatable/equatable.dart';

// TODO add phrases

class WordDetailsModel extends Equatable {
  const WordDetailsModel(
      {this.word,
      this.translate,
      this.phoneticSpelling,
      this.definitions,
      this.lexicalCategory,
      this.audioPath,
      this.phrases,
      this.synonyms});

  factory WordDetailsModel.fromJson(Map<String, dynamic> json) {
    // List<dynamic>? finalPhrases;
    // List<dynamic>? syn;
    // List<dynamic>? syn2;
    // Map<String, dynamic>? syn3;
    // if (json['entries'][0]['senses'][0]['synonyms'] != null) {
    //   syn = json['entries'][0]['senses'][0]['synonyms'];
    // }
    // if (json['entries'][0]['senses'][0]['synonyms'] == null &&
    //     json['entries'][0]['senses'][0]['subsenses'] != null) {
    //   syn2 = json['entries'][0]['senses'][0]['subsenses'];
    //   syn3 = syn2?.firstWhere((element) => element['synonyms'] != null);
    // } else if (json['phrases'] != null) {
    //   finalPhrases = json['phrases'];
    // }
    // if (json['phrases'] == null) {
    //   finalPhrases = json['entries'][0]['senses'][0]['examples'];
    // }
    String? phonetic;
    Map<String, dynamic>? phonetic1;
    final List<dynamic>? phonetic2;
    if (json['phonetic'] != null) {
      phonetic = json['phonetic'];
    } else {
      phonetic2 = json['phonetics'] as List<dynamic>;
      phonetic1 = phonetic2.firstWhere((element) => element['text'] != null);
    }

    final List<dynamic>? meanings = json['meanings'];
    final List<dynamic>? finalSynonymsList;
    Map<String, dynamic>? syn =
        meanings?.firstWhere((element) => element['synonyms'] != null);
    List<dynamic>? synonymsList = syn?['synonyms'];
    if (synonymsList!.isEmpty) {
      finalSynonymsList = null;
    } else {
      finalSynonymsList = synonymsList;
    }

    final List<dynamic>? jsonPhrases = meanings
        ?.map((element) => element['definitions'][0]['example'])
        .skipWhile((value) => value == null)
        .toList();
    final List<dynamic>? finalPhrases;
    if (jsonPhrases!.isNotEmpty) {
      finalPhrases = jsonPhrases;
    } else {
      finalPhrases = null;
    }

    return WordDetailsModel(
        word: json['word'] as String?,
        phoneticSpelling: phonetic ?? phonetic1?['text'] as String?,
        definitions:
            json['meanings'][0]['definitions'][0]['definition'] as String?,
        lexicalCategory: json['meanings'][0]['partOfSpeech'] as String?,
        audioPath: json['phonetics'][0]['audio'] as String?,
        synonyms: finalSynonymsList,
        phrases: finalPhrases);
  }

  final String? word;
  final String? phoneticSpelling;
  final String? translate;
  final String? definitions;
  final String? lexicalCategory;
  final String? audioPath;
  final List<dynamic>? phrases;
  final List<dynamic>? synonyms;

  @override
  List<Object?> get props => [
        word,
        translate,
        phoneticSpelling,
        definitions,
        lexicalCategory,
        audioPath,
        phrases,
        synonyms
      ];
}
