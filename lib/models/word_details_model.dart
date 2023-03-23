// ignore_for_file: unrelated_type_equality_checks

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
      this.synonyms});

  factory WordDetailsModel.fromJson(Map<String, dynamic> json) {
    
    //phoneticSpelling
    String? phonetic;
    String? phonetic3;
    Map<String, dynamic>? phonetic2;
    final List<dynamic>? phonetic1;
    if (json['phonetic'] != null) {
      phonetic = json['phonetic'];
    } else {
      phonetic1 = json['phonetics'] as List<dynamic>;
      phonetic2 = phonetic1.firstWhere((element) => element['text'] != null);
      phonetic3 = phonetic2?['text'];
    }
    final String? finalPhotetic = phonetic?.substring(1, phonetic.length - 1);
    final String? finalPhonetic1 = phonetic3?.substring(1, phonetic3.length - 1);

    // synonyms
    final List<dynamic>? meanings = json['meanings'];
    List<dynamic>? finalSynonymsList;
    Map<String, dynamic>? syn = meanings?.firstWhere((element) {
      final List<dynamic> list = element['synonyms'];
      if (list.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }, orElse: () => null);
    List<dynamic>? synonymsList = syn?['synonyms'];
    if (syn == null) {
      finalSynonymsList = null;
    } else {
      finalSynonymsList = synonymsList;
    }

    // phrases
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

    // lexical categories
    final List<dynamic>? lexicalCategories =
        meanings?.map((e) => e['partOfSpeech']).toList();

    // audio path
    final List<dynamic>? audioList = json['phonetics'];
    String? finalAudio;
    Map<String, dynamic>? audioMap = audioList?.firstWhere(
      (element) {
        final String? isAudio = element['audio'];
        if (isAudio != '') {
          return true;
        } else {
          return false;
        }
      },
      orElse: () => null,
    );
    String? audio = audioMap?['audio'];
    if (audioMap == null) {
      finalAudio = null;
    } else {
      finalAudio = audio;
    }

    return WordDetailsModel(
        word: json['word'] as String?,
        phoneticSpelling: finalPhotetic ?? finalPhonetic1,
        definitions:
            json['meanings'][0]['definitions'][0]['definition'] as String?,
        lexicalCategory: lexicalCategories,
        audioPath: finalAudio,
        synonyms: finalSynonymsList,
        phrases: finalPhrases);
  }

  final String? word;
  final String? phoneticSpelling;
  final String? translate;
  final String? definitions;
  final List<dynamic>? lexicalCategory;
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
