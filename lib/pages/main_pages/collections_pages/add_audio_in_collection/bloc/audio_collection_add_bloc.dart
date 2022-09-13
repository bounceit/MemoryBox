import 'dart:async';

import 'package:audio_fairy_tales/repositories/collections_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'audio_collection_add_event.dart';
part 'audio_collection_add_state.dart';

class ListCollectionAddAudioInCollectionBloc extends Bloc<
    ListCollectionAddAudioInCollectionEvent,
    ListCollectionAddAudioInCollectionState> {
  ListCollectionAddAudioInCollectionBloc()
      : super(
          const ListCollectionAddAudioInCollectionState(),
        ) {
    on<LoadListCollectionAddAudioInCollectionEvent>((
      LoadListCollectionAddAudioInCollectionEvent event,
      Emitter<ListCollectionAddAudioInCollectionState> emit,
    ) {
      try {
        _audioSubscription?.cancel();
        _audioSubscription = CollectionsRepositories.instance
            .readCollections()
            .listen((audioList) {
          add(
            UpdateListCollectionAddAudioInCollectionEvent(
              list: audioList,
            ),
          );
        });
      } on Exception {
        emit(
          state.copyWith(
            status: ListCollectionAddAudioInCollectionStatus.failed,
          ),
        );
      }
    });

    on<UpdateListCollectionAddAudioInCollectionEvent>((
      UpdateListCollectionAddAudioInCollectionEvent event,
      Emitter<ListCollectionAddAudioInCollectionState> emit,
    ) {
      if (event.list.isNotEmpty) {
        emit(
          state.copyWith(
            status: ListCollectionAddAudioInCollectionStatus.success,
            list: event.list,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ListCollectionAddAudioInCollectionStatus.emptyList,
          ),
        );
      }
    });
  }
  StreamSubscription? _audioSubscription;
  @override
  Future<void> close() {
    _audioSubscription?.cancel();
    return super.close();
  }
}
