import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/models/word_translate_model.dart';

@Injectable(as: FirestoreProviderI)
class FirestoreProvider implements FirestoreProviderI {
  @override
  Future<void> createWord(WordTranslateModel word) async {
    final docWord = FirebaseFirestore.instance.collection('words').doc();
    await docWord.set(word.toMap());
  }

  @override
  Future<String> getId(String translation) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('words')
        .where("translatedText", isEqualTo: translation)
        .get();
    final wordId = snapshot.docs.first.id;
    return wordId;
  }

  @override
  Future<void> deleteWord(String id) async {
    await FirebaseFirestore.instance.collection('words').doc(id).delete();
  }

  @override
  Stream<List<WordTranslateModel>> readWords() {
    return FirebaseFirestore.instance
        .collection('words')
        .snapshots()
        .map((event) {
      return event.docs
          .map((e) => WordTranslateModel.fromMap(e.data()))
          .toList();
    });
  }
}

abstract class FirestoreProviderI {
  Future<void> createWord(WordTranslateModel word);
  Stream<List<WordTranslateModel>> readWords();
  Future<void> deleteWord(String id);
  Future<String> getId(String word);
}
