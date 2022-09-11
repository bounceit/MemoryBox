import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/user_repositories.dart';

part 'support_event.dart';
part 'support_state.dart';

class SupportMessageBloc
    extends Bloc<SupportMessageEvent, SupportMessageState> {
  SupportMessageBloc()
      : super(
          const SupportMessageState(),
        ) {
    on<LoadSupportMessageEvent>((
      LoadSupportMessageEvent event,
      Emitter<SupportMessageState> emit,
    ) {
      try {
        _messageSubscription?.cancel();
        _messageSubscription =
            UserRepositories.instance.readUserShat().listen((shatList) {
          add(
            UpdateSupportMessageEvent(
              list: shatList,
            ),
          );
        });
      } on Exception {
        emit(
          state.copyWith(
            status: SupportMessageStatus.failed,
          ),
        );
      }
    });

    on<UpdateSupportMessageEvent>((
      UpdateSupportMessageEvent event,
      Emitter<SupportMessageState> emit,
    ) {
      emit(
        state.copyWith(
          status: SupportMessageStatus.success,
          list: event.list,
        ),
      );
    });
  }
  StreamSubscription? _messageSubscription;

  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    return super.close();
  }
}
