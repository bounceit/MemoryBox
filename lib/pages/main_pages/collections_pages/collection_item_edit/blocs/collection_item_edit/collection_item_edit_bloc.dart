import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'collection_item_edit_event.dart';
part 'collection_item_edit_state.dart';

class CollectionItemEditBloc
    extends Bloc<CollectionItemEditEvent, CollectionItemEditState> {
  CollectionItemEditBloc()
      : super(
          const CollectionItemEditState(),
        ) {
    on<CollectionItemEditEvent>((
      event,
      emit,
    ) {
      emit(
        state.copyWith(
          title: event.title,
          subTitle: event.subTitle,
        ),
      );
    });
  }
}
