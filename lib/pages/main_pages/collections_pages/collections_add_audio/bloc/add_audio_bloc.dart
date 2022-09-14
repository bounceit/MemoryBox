import 'dart:async';

import 'package:audio_fairy_tales/repositories/audio_firebase_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_audio_event.dart';
part 'add_audio_state.dart';

class CollectionAddAudioBloc
    extends Bloc<CollectionAddAudioEvent, CollectionAddAudioState> {
  CollectionAddAudioBloc()
      : super(
          const CollectionAddAudioState(),
        ) {
    on<LoadCollectionAddAudioEvent>((
      LoadCollectionAddAudioEvent event,
      Emitter<CollectionAddAudioState> emit,
    ) {
      try {
        if (event.sort == null || event.sort == '') {
          _audioSubscription?.cancel();
          _audioSubscription = AudioRepositories.instance
              .readAudio(
            'all',
            'Collections',
            'collections',
          )
              .listen((audioList) {
            add(
              UpdateCollectionAddAudioEvent(
                list: audioList,
              ),
            );
          });
        } else {
          _audioSubscription?.cancel();
          _audioSubscription = AudioRepositories.instance
              .readAudio(
            event.sort!,
            'Collections',
            'searchName',
          )
              .listen((audioList) {
            add(
              UpdateCollectionAddAudioEvent(
                list: audioList,
              ),
            );
          });
        }
      } on Exception {
        emit(
          state.copyWith(
            status: CollectionAddAudioStatus.failed,
          ),
        );
      }
    });

    on<UpdateCollectionAddAudioEvent>((
      UpdateCollectionAddAudioEvent event,
      Emitter<CollectionAddAudioState> emit,
    ) {
      emit(
        state.copyWith(
          status: CollectionAddAudioStatus.success,
          list: event.list,
        ),
      );
    });
  }
  StreamSubscription? _audioSubscription;
  @override
  Future<void> close() {
    _audioSubscription?.cancel();
    return super.close();
  }
}
