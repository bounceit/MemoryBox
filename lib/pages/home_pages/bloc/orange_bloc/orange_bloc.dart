import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/collections_model.dart';
import '../../../../repositories/collections_repositories.dart';

part 'orange_event.dart';
part 'orange_state.dart';

class OrangeListItemBloc
    extends Bloc<OrangeListItemEvent, OrangeListItemState> {
  OrangeListItemBloc()
      : super(
          const OrangeListItemState(),
        ) {
    on<LoadOrangeListItemEvent>((
      LoadOrangeListItemEvent event,
      Emitter<OrangeListItemState> emit,
    ) {
      try {
        _collectionSubscription?.cancel();
        _collectionSubscription = CollectionsRepositories.instance
            .readCollections()
            .listen((collection) {
          add(
            UpdateOrangeListItemEvent(
              list: collection,
            ),
          );
        });
      } on Exception {
        emit(
          state.copyWith(
            status: OrangeListItemStatus.failed,
          ),
        );
      }
    });

    on<UpdateOrangeListItemEvent>((
      UpdateOrangeListItemEvent event,
      Emitter<OrangeListItemState> emit,
    ) {
      if (event.list.isNotEmpty) {
        emit(
          state.copyWith(
            status: OrangeListItemStatus.success,
            list: event.list,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: OrangeListItemStatus.emptyList,
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
