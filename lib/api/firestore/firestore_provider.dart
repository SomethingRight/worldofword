import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/models/word_translate_model.dart';

@Injectable(as: FirestoreProviderI)
class FirestoreProvider implements FirestoreProviderI {
  @override
  Future<void> createWord(WordTranslateModel word) async {
    try {
      final docWord = FirebaseFirestore.instance.collection('words').doc();
      await docWord.set(word.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> deleteWord() {
    throw UnimplementedError();
  }

  @override
  Future<List<WordTranslateModel>> readWords() async {
     List<WordTranslateModel> listWords = [];
    try {
      final words = await FirebaseFirestore.instance.collection('words').get();
      listWords = words.docs.map((e) => WordTranslateModel.fromMap(e.data())).toList();
      return listWords;
    } catch (e) {
      return throw (e.toString());
    }
  }
}

abstract class FirestoreProviderI {
  Future<void> createWord(WordTranslateModel word);
  Future<List<WordTranslateModel>> readWords();
  Future<void> deleteWord();
}
