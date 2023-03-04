import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:worldofword/api/word_api/word_details/word_details_repository.dart';
import 'package:worldofword/models/word_details_model.dart';

part 'word_details_event.dart';
part 'word_details_state.dart';

@Injectable()
class WordDetailsBloc extends Bloc<WordDetailsEvent, WordDetailsState> {
  final WordDetailsRepository _repository;
  AudioPlayer audioPlayer = AudioPlayer();
  WordDetailsBloc(this._repository) : super(WordDetailsEmpty()) {
    on<LoadWordDetails>((event, emit) async {
      emit(WordDetailsLoading());
      try {
        await _repository
            .getWordsDetails(event.word)
            .then((value) => emit(WordDetailsLoaded(wordDetails: value)));
      } catch (e) {
        throw ErrorWidget(e);
      }
      on<PlayAudio>((event, emit) async {
        final Source audioUrl = UrlSource(event.audioPath);
        await audioPlayer.play(audioUrl);
      });
    });
  }
  void init(String word) {
    add(LoadWordDetails(word: word));
  }
}
