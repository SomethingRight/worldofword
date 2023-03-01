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
    // TODO: implement deleteWord
    throw UnimplementedError();
  }

  @override
  Future<void> readWords() {
    // TODO: implement readWords
    throw UnimplementedError();
  }
}

abstract class FirestoreProviderI {
  Future<void> createWord(WordTranslateModel word);
  Future<void> readWords();
  Future<void> deleteWord();
}
