import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'collection_item_event.dart';
part 'collection_item_state.dart';

class CollectionItemAnimBloc
    extends Bloc<CollectionItemAnimEvent, CollectionItemAnimState> {
  CollectionItemAnimBloc()
      : super(
          const CollectionItemAnimState(),
        ) {
    on<CollectionItemAnimEvent>((
      event,
      emit,
    ) {
      emit(
        state.copyWith(
          anim: event.anim,
        ),
      );
    });
  }
}
