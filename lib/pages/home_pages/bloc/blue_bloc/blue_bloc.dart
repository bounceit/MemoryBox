import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/collections_model.dart';
import '../../../../repositories/collections_repositories.dart';

part 'blue_event.dart';
part 'blue_state.dart';

class BlueListItemBloc extends Bloc<BlueListItemEvent, BlueListItemState> {
  BlueListItemBloc()
      : super(
          const BlueListItemState(),
        ) {
    on<LoadBlueListItemEvent>((
      LoadBlueListItemEvent event,
      Emitter<BlueListItemState> emit,
    ) {
      try {
        _collectionSubscription?.cancel();
        _collectionSubscription = CollectionsRepositories.instance
            .readCollections()
            .listen((collection) {
          add(
            UpdateBlueListItemEvent(
              list: collection,
            ),
          );
        });
      } on Exception {
        emit(
          state.copyWith(
            status: BlueListItemStatus.failed,
          ),
        );
      }
    });

    on<UpdateBlueListItemEvent>((
      UpdateBlueListItemEvent event,
      Emitter<BlueListItemState> emit,
    ) {
      if (event.list.isNotEmpty) {
        emit(
          state.copyWith(
            status: BlueListItemStatus.success,
            list: event.list,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: BlueListItemStatus.emptyList,
          ),
        );
      }
    });
  }
  StreamSubscription? _collectionSubscription;
  @override
  Future<void> close() {
    _collectionSubscription?.cancel();
    return super.close();
  }
}
