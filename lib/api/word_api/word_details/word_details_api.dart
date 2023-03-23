import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:injectable/injectable.dart';
import 'package:worldofword/models/word_details_model.dart';

@LazySingleton(as: WordDetailsApiI)
class WordDetailsApi implements WordDetailsApiI {
  static const String endpoint = 'entries';
  static const String languageCode = 'en';

  @override
  Future<WordDetailsModel> getWordsDetails(String wordId) async {
    final String url =
        'https://api.dictionaryapi.dev/api/v2/$endpoint/$languageCode/$wordId';
    final http.Response response = await http.get(Uri.parse(url));
    debugPrint(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body) as List<dynamic>;
      final Map<String, dynamic> wordData = body.first;
      final WordDetailsModel wordDetails = WordDetailsModel.fromJson(wordData);
      return wordDetails;
    }
    if (response.statusCode == 404) {
      final Map<String, dynamic> body =
          json.decode(response.body) as Map<String, dynamic>;
      throw ErrorHint(body['title']);
    } else {
      final Exception exception = Exception('something went wrong');
      throw exception;
    }
  }
}

abstract class WordDetailsApiI {
  Future<WordDetailsModel> getWordsDetails(String wordId);
}
