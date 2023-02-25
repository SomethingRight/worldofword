import 'package:injectable/injectable.dart';
import 'package:worldofword/api/word_api/word_traslate/word_translate_api.dart';
import 'package:worldofword/models/word_translate_model.dart';


@lazySingleton
class WordTranslateRepository {

  Future<List<WordTranslateModel>> getWord(String currentWord) {
    return _provider.getWord(currentWord);
  }

  final _provider = WordTranslateApi();
}
