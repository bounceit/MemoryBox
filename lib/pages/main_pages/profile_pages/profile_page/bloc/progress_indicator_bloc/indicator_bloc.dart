import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../repositories/user_repositories.dart';

part 'indicator_event.dart';
part 'indicator_state.dart';

class ProgressIndicatorBloc
    extends Bloc<ProgressIndicatorEvent, ProgressIndicatorState> {
  ProgressIndicatorBloc()
      : super(
          const ProgressIndicatorState(),
        ) {
    on<LoadProgressIndicatorEvent>((
      LoadProgressIndicatorEvent event,
      Emitter<ProgressIndicatorState> emit,
    ) {
      try {
        _progressIndicatorSubscription?.cancel();
        _progressIndicatorSubscription =
            UserRepositories.instance.readUser().listen((progressIndicator) {
          add(
            UpdateProgressIndicatorEvent(progressIndicator: progressIndicator),
          );
        });
      } on Exception {
        emit(
          state.copyWith(
            status: ProgressIndicatorStatus.failed,
          ),
        );
      }
    });

    on<UpdateProgressIndicatorEvent>((
      UpdateProgressIndicatorEvent event,
      Emitter<ProgressIndicatorState> emit,
    ) {
      if (event.progressIndicator.isEmpty) {
        emit(
          state.copyWith(
            status: ProgressIndicatorStatus.emptyList,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ProgressIndicatorStatus.success,
            progressIndicator: event.progressIndicator,
          ),
        );
      }
    });
  }
  StreamSubscription? _progressIndicatorSubscription;
  @override
  Future<void> close() {
    _progressIndicatorSubscription?.cancel();
    return super.close();
  }
}
