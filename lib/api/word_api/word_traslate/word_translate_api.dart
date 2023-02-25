import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:injectable/injectable.dart';
import 'package:worldofword/models/word_translate_model.dart';


@LazySingleton(as: WordTranslateApiI)
class WordTranslateApi implements WordTranslateApiI {
  static const String appId = 'e87028d3';
  static const String appKey = '9e8cdfb696bfd77cef35e3625f6dcae7';
  static const String endpoint = 'translations';
  static const String sourceLang = 'en';
  static const String targetLang = 'ru';

  @override
  Future<List<WordTranslateModel>> getWord(String wordId) async {
    
      final String uri =
        'https://od-api.oxforddictionaries.com/api/v2/$endpoint/$sourceLang/$targetLang/$wordId';
      
    final http.Response response = await http
        .get(Uri.parse(uri), headers: {"app_id": appId, "app_key": appKey});
          debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      final Map<String, dynamic> resp =
          json.decode(response.body) as Map<String, dynamic>;
      final Map<String, dynamic> dataFirstLevel =
          resp['results'][0] as Map<String, dynamic>;
      final List<dynamic> dataSecondLevel =
          dataFirstLevel['lexicalEntries'] as List<dynamic>;
      final List<WordTranslateModel> wordData = dataSecondLevel
          .map((dynamic e) =>
              WordTranslateModel.fromJson(e as Map<String, dynamic>))
          .toList();
      final List<WordTranslateModel> finalData =
          wordData.where((e) => e.translate != 'notranslation').toList();
      return finalData;
    } else if (response.statusCode == 404) {
      throw WordExistException();
    }
    return [];
    
  }
}

abstract class WordTranslateApiI {
  Future<List<WordTranslateModel>> getWord(String wordId);
}


class WordExistException implements Exception{
  @override
  String toString() => 'incorrect word';
}