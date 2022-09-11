import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'anim_event.dart';
part 'anim_state.dart';

class AnimBloc extends Bloc<AnimEvent, AnimState> {
  AnimBloc()
      : super(
          const AnimState(),
        ) {
    on<AnimEvent>((event, emit) {
      emit(
        state.copyWith(
          anim: event.anim,
        ),
      );
    });
  }
}
