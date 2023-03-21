import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'package:injectable/injectable.dart';
import 'package:worldofword/models/word_details_model.dart';

@LazySingleton(as: WordDetailsApiI)
class WordDetailsApi implements WordDetailsApiI {
  // static const String appId = 'e87028d3';
  // static const String appKey = '9e8cdfb696bfd77cef35e3625f6dcae7';
  static const String endpoint = 'entries';
  //static const String languageCode = 'en-us';
  static const String languageCode = 'en';

  @override
  Future<WordDetailsModel> getWordsDetails(String wordId) async {
    final String url =
        'https://api.dictionaryapi.dev/api/v2/$endpoint/$languageCode/$wordId';
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body) as List<dynamic>;
      final Map<String, dynamic> wordData = body.first;
      final WordDetailsModel wordDetails = WordDetailsModel.fromJson(wordData);

      // final String uri =
      //     'https://od-api.oxforddictionaries.com/api/v2/$endpoint/$languageCode/$wordId';
      // final http.Response response = await http
      //     .get(Uri.parse(uri), headers: {"app_id": appId, "app_key": appKey});
      // if (response.statusCode == 200) {
      //   final Map<String, dynamic> resp =
      //       json.decode(response.body) as Map<String, dynamic>;
      //   final Map<String, dynamic> dataFirstLevel =
      //       resp['results'][0] as Map<String, dynamic>;
      //   final Map<String, dynamic> dataSecondLevel =
      //       dataFirstLevel['lexicalEntries'][0] as Map<String, dynamic>;
      //   final WordDetailsModel wordData =
      //       WordDetailsModel.fromJson(dataSecondLevel);
      return wordDetails;
    } else {
      final Error error = ArgumentError('Something went wrong');
      throw error;
    }
  }
}

abstract class WordDetailsApiI {
  Future<WordDetailsModel> getWordsDetails(String wordId);
}
