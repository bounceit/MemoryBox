import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/audio_firebase_repositories.dart';

part 'list_item_event.dart';
part 'list_item_state.dart';

class ListItemBloc extends Bloc<ListItemEvent, ListItemState> {
  ListItemBloc()
      : super(
          const ListItemState(),
        ) {
    on<LoadListItemEvent>((
      LoadListItemEvent event,
      Emitter<ListItemState> emit,
    ) {
      try {
        _audioSubscription?.cancel();
        _audioSubscription = AudioRepositories.instance
            .readAudio(
          event.sort!,
          event.collection!,
          event.nameSort!,
        )
            .listen((audioList) {
          add(
            UpdateListItemEvent(
              list: audioList,
            ),
          );
        });
      } on Exception {
        emit(state.copyWith(
          status: ListItemStatus.failed,
        ));
      }
    });

    on<UpdateListItemEvent>((
      UpdateListItemEvent event,
      Emitter<ListItemState> emit,
    ) {
      if (event.list.isNotEmpty) {
        emit(
          state.copyWith(
            status: ListItemStatus.success,
            list: event.list,
          ),
        );
      } else {
        emit(state.copyWith(
          status: ListItemStatus.emptyList,
        ));
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
