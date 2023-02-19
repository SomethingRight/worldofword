import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:worldofword/api/word_api/word_traslate/word_translate_api.dart';
import 'package:worldofword/models/word_translate_model.dart';

class MainPageSearchBLoc {
  MainPageSearchBLoc({required this.repository});

  final WordTranslateApiI repository;
  final BehaviorSubject<List<WordTranslateModel>> _subject =
      BehaviorSubject<List<WordTranslateModel>>();

  void search(String word) {
    repository.getWord(word).then((wordData) {
      _subject.sink.add(wordData);
    }, onError: (dynamic e) {
      if (e is WordExistException) {
        _subject.sink.add([]);
      }
    });
  }

  void dispose() {
    _subject.close();
  }

  BehaviorSubject<List<WordTranslateModel>> get subject => _subject;
}
