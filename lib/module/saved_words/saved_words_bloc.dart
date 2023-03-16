// ignore_for_file: void_checks, invalid_use_of_visible_for_testing_member
import 'dart:collection';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/firestore/firestore_provider.dart';
import '../../models/word_translate_model.dart';

part 'saved_words_event.dart';
part 'saved_words_state.dart';

@Injectable()
class SavedWordsBloc extends Bloc<SavedWordsEvent, SavedWordsState> {
  final FirestoreProviderI _firestoreProvider;
  SavedWordsBloc({required FirestoreProviderI firestoreService})
      : _firestoreProvider = firestoreService,
        super(SavedWordsEmpty()) {
    on<StartSavedList>((event, emit) async {
      if (state is! SavedWordsLoaded) {
        emit(SavedWordsLoading());
      }
    });
    on<AddToSavedList>((event, emit) async {
      _firestoreProvider.createWord(event.word);
    });
    on<RemoveFromSavedList>((event, emit) async {
      _firestoreProvider
          .getId(event.translation)
          .then((value) => _firestoreProvider.deleteWord(value));
    });
    init();
  }
  void init() async {
    emit(SavedWordsLoading());
    _firestoreProvider.readWords().listen((value) {
      emit(SavedWordsLoaded(savedList: UnmodifiableListView(value)));
    }, onError: (dynamic e) {
      log(e);
    });
  }
}
