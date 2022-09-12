import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../repositories/collections_repositories.dart';

part 'list_item_collections_event.dart';
part 'list_item_collections_state.dart';

class ListItemCollectionBloc
    extends Bloc<ListItemCollectionEvent, ListItemCollectionState> {
  ListItemCollectionBloc()
      : super(
          const ListItemCollectionState(),
        ) {
    on<LoadListItemCollectionEvent>((
      LoadListItemCollectionEvent event,
      Emitter<ListItemCollectionState> emit,
    ) {
      try {
        _audioSubscription?.cancel();
        _audioSubscription = CollectionsRepositories.instance
            .readCollections()
            .listen((audioList) {
          add(
            UpdateListItemCollectionEvent(list: audioList),
          );
        });
      } on Exception {
        emit(
          state.copyWith(
            status: ListItemCollectionStatus.failed,
          ),
        );
      }
    });

    on<UpdateListItemCollectionEvent>((
      UpdateListItemCollectionEvent event,
      Emitter<ListItemCollectionState> emit,
    ) {
      if (event.list.isNotEmpty) {
        emit(
          state.copyWith(
            status: ListItemCollectionStatus.success,
            list: event.list,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ListItemCollectionStatus.emptyList,
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
