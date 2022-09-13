import 'dart:async';

import 'package:audio_fairy_tales/pages/main_pages/all_audio_pages/bloc/bloc_total_qual/total_event.dart';
import 'package:audio_fairy_tales/pages/main_pages/all_audio_pages/bloc/bloc_total_qual/total_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../repositories/user_repositories.dart';

class QualityTotalTimeBloc
    extends Bloc<QualityTotalTimeEvent, QualityTotalTimeState> {
  QualityTotalTimeBloc()
      : super(
          const QualityTotalTimeState(),
        ) {
    on<LoadQualityTotalTimeEvent>((
      LoadQualityTotalTimeEvent event,
      Emitter<QualityTotalTimeState> emit,
    ) {
      try {
        _qualityTotalTimeSubscription?.cancel();
        _qualityTotalTimeSubscription =
            UserRepositories.instance.readUser().listen((qualityTotalTime) {
          add(
            UpdateQualityTotalTimeEvent(
              qualityTotalTime: qualityTotalTime,
            ),
          );
        });
      } on Exception {
        emit(state.copyWith(
          status: QualityTotalTimeStatus.failed,
        ));
      }
    });

    on<UpdateQualityTotalTimeEvent>((
      UpdateQualityTotalTimeEvent event,
      Emitter<QualityTotalTimeState> emit,
    ) {
      emit(
        state.copyWith(
          status: QualityTotalTimeStatus.success,
          qualityTotalTime: event.qualityTotalTime,
        ),
      );
    });
  }
  StreamSubscription? _qualityTotalTimeSubscription;
  @override
  Future<void> close() {
    _qualityTotalTimeSubscription?.cancel();
    return super.close();
  }
}
