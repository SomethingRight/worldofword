import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:worldofword/models/saved_list_model.dart';
import 'package:worldofword/models/word_details_model.dart';

part 'saved_words_event.dart';
part 'saved_words_state.dart';

class SavedWordsBloc extends Bloc<SavedWordsEvent, SavedWordsState> {
  SavedWordsBloc() : super(SavedWordsLoading()) {
    on<StartSavedList>((event, emit) async {
      emit(SavedWordsLoading());
      try {
       await  Future<void>.delayed(const Duration(seconds: 1));
       emit(const SavedWordsLoaded());
      } catch (_) {}
    });
    on<AddToSavedList>((event, emit) {
      if (state is SavedWordsLoaded){
        SavedWordsLoaded state;
        //emit(SavedWordsLoaded(savedList: List.from(state.savedList.wordsList)..add(event.word) ));
      }
    });
    on<RemoveFromSavedList>((event, emit) {
      if (state is SavedWordsLoaded){
        SavedWordsLoaded state;
        //emit(SavedWordsLoaded(savedList: List.from(state.savedList.wordsList)..remove(event.word) ));
      }
    });
  }
}
