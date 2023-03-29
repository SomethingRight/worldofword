import 'dart:async';
import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:injectable/injectable.dart';
import 'package:worldofword/models/word_translate_model.dart';

@LazySingleton(as: WordTranslateApiI)
class WordTranslateApi implements WordTranslateApiI {
  static const String _apiKey = 'apiKey';
  static const String languageCode = 'ru';

  @override
  Future<WordTranslateModel> getWord(String wordId) async {
    final String uri =
        'https://translation.googleapis.com/language/translate/v2?target=$languageCode&key=$_apiKey&q=$wordId';
    final response = await http.post(Uri.parse(uri));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final List<dynamic> translations =
          body['data']['translations'] as List<dynamic>;
      final List<WordTranslateModel> words = translations
          .map((e) => WordTranslateModel.fromJson(e as Map<String, dynamic>))
          .toList();
      final word = words.first;
      word.word = wordId;
      return word;
    } else if (response.statusCode == 404) {
      throw WordExistException();
    }
    return WordTranslateModel();
  }
}

abstract class WordTranslateApiI {
  Future<WordTranslateModel> getWord(String wordId);
}

class WordExistException implements Exception {
  @override
  String toString() => 'incorrect word';
}
