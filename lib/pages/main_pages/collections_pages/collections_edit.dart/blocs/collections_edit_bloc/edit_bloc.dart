import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_event.dart';
part 'edit_state.dart';

class CollectionEditBloc
    extends Bloc<CollectionEditEvent, CollectionEditState> {
  CollectionEditBloc()
      : super(
          const CollectionEditState(),
        ) {
    on<CollectionEditEvent>((
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
