import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:worldofword/models/word_translate_model.dart';

class WordTranslateApi implements WordTranslateApiI {
  static const String appId = 'e87028d3';
  static const String appKey = '9e8cdfb696bfd77cef35e3625f6dcae7';
  static const String endpoint = 'translations';
  static const String sourceLang = 'en';
  static const String targetLang = 'ru';

  @override
  Future<WordTranslateModel> getWord(String wordId) async {
    final String uri =
        'https://od-api.oxforddictionaries.com/api/v2/$endpoint/$sourceLang/$targetLang/$wordId';
    final http.Response response = await http
        .get(Uri.parse(uri), headers: {"app_id": appId, "app_key": appKey});
    if (response.statusCode == 200) {
      final Map<String, dynamic> resp =
          json.decode(response.body) as Map<String, dynamic>;
      final Map<String, dynamic> dataFirstLevel =
          resp['results'][0] as Map<String, dynamic>;
      final Map<String, dynamic> dataSecondLevel =
          dataFirstLevel['lexicalEntries'][0] as Map<String, dynamic>;
      final WordTranslateModel wordData = WordTranslateModel.fromJson(dataSecondLevel);
      debugPrint(wordData.toString());
      return wordData;
    } else {
      final Error error = ArgumentError('Something went wrong');
      throw error;
    }
  }
}

abstract class WordTranslateApiI {
  Future<WordTranslateModel> getWord(String wordId);
}
