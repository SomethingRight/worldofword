import 'package:injectable/injectable.dart';
import 'package:worldofword/api/word_api/word_traslate/word_translate_api.dart';
import 'package:worldofword/models/word_translate_model.dart';

@LazySingleton(as: WordTranslateRepositoryI)
class WordTranslateRepository implements WordTranslateRepositoryI {
  const WordTranslateRepository({required this.wordTranslateApi});

  @override
  Future<WordTranslateModel> getWord(String currentWord) {
    return wordTranslateApi.getWord(currentWord);
  }

  final WordTranslateApiI wordTranslateApi;
}

abstract class WordTranslateRepositoryI {
  Future<WordTranslateModel> getWord(String currentWord);
}
