import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'record_event.dart';
part 'record_state.dart';

class RecordingsPageBloc
    extends Bloc<RecordingsPageEvent, RecordingsPageState> {
  RecordingsPageBloc()
      : super(
          const RecordingsPageState(),
        ) {
    on<RecordingsPageEvent>((
      event,
      emit,
    ) {
      emit(
        state.copyWith(
          path: event.path,
          minutes: event.minutes,
          seconds: event.seconds,
        ),
      );
    });
  }
}
