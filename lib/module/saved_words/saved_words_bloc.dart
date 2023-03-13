// ignore_for_file: void_checks
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/firestore/firestore_provider.dart';
import '../../models/word_translate_model.dart';

part 'saved_words_event.dart';
part 'saved_words_state.dart';

@Injectable()
class SavedWordsBloc extends Bloc<SavedWordsEvent, SavedWordsState> {
  final FirestoreProviderI _firestoreService;
  SavedWordsBloc({required FirestoreProviderI firestoreService})
      : _firestoreService = firestoreService,
        super(SavedWordsEmpty()) {
    on<StartSavedList>((event, emit) async {
      if (state is! SavedWordsLoaded) {
        emit(SavedWordsLoading());
      }
      try {
        await _firestoreService
            .readWords()
            .then((value) => emit(SavedWordsLoaded(savedList: value)));
      } catch (e) {
        throw ErrorWidget(e);
      }
    });
    on<AddToSavedList>((event, emit) {
      _firestoreService.createWord(event.word);
    });
    on<RemoveFromSavedList>((event, emit) async {
      await _firestoreService
          .getId(event.translation)
          .then((value) => _firestoreService.deleteWord(value));
      add(StartSavedList());
    });
  }
  void init() {
    add(StartSavedList());
  }
}
