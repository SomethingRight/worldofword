import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/word_api/word_traslate/word_translate_repository.dart';
import 'package:worldofword/models/word_translate_model.dart';

part 'word_load_event.dart';
part 'word_load_state.dart';

@Injectable()
class WordLoadBloc extends Bloc<WordLoadEvent, WordLoadState> {
  final WordTranslateRepositoryI _repository;
  WordLoadBloc(this._repository) : super(WordEmptyState()) {
    on<WordLoading>((event, emit) async {
      try {
        emit(WordLoadingState());
        final wordList = await _repository.getWord(event.word);

        emit(WordLoadedState(words: wordList));
      } catch (e) {
        emit(WordError(e.toString()));
      }
    });
    on<WordEmpty>((event, emit) {
      emit(WordEmptyState());
    });
  }
}
