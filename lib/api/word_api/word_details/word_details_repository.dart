import 'package:injectable/injectable.dart';
import 'package:worldofword/api/word_api/word_details/word_details_api.dart';
import 'package:worldofword/models/word_details_model.dart';

@LazySingleton(as: WordDetailsRepositoryI)
class WordDetailsRepository implements WordDetailsRepositoryI {
  WordDetailsRepository({required this.wordDetailsApi});

  @override
  Future<WordDetailsModel> getWordsDetails(String word) {
    return wordDetailsApi.getWordsDetails(word);
  }

  final WordDetailsApiI wordDetailsApi;
}

abstract class WordDetailsRepositoryI {
  Future<WordDetailsModel> getWordsDetails(String word);
}
