import 'package:injectable/injectable.dart';
import 'package:worldofword/api/word_api/word_details/word_details_api.dart';
import 'package:worldofword/models/word_details_model.dart';


@LazySingleton()
class WordDetailsRepository {
  Future<WordDetailsModel> getWordsDetails(String word) {
    return _provider.getWordsDetails(word);
  }

  final _provider = WordDetailsApi();
}
