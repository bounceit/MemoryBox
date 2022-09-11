import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/collections_model.dart';
import '../../../../repositories/collections_repositories.dart';

part 'green_event.dart';
part 'green_state.dart';

class GreenListItemBloc extends Bloc<GreenListItemEvent, GreenListItemState> {
  GreenListItemBloc()
      : super(
          const GreenListItemState(),
        ) {
    on<LoadGreenListItemEvent>((
      LoadGreenListItemEvent event,
      Emitter<GreenListItemState> emit,
    ) {
      try {
        _collectionSubscription?.cancel();
        _collectionSubscription = CollectionsRepositories.instance
            .readCollections()
            .listen((collection) {
          add(
            UpdateGreenListItemEvent(
              list: collection,
            ),
          );
        });
      } on Exception {
        emit(
          state.copyWith(
            status: GreenListItemStatus.failed,
          ),
        );
      }
    });

    on<UpdateGreenListItemEvent>((
      UpdateGreenListItemEvent event,
      Emitter<GreenListItemState> emit,
    ) {
      if (event.list.isNotEmpty) {
        emit(
          state.copyWith(
            status: GreenListItemStatus.success,
            list: event.list,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: GreenListItemStatus.emptyList,
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
