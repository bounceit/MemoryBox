import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc()
      : super(
          const ProfileEditState(),
        ) {
    on<ProfileEditEvent>((
      event,
      emit,
    ) {
      emit(
        state.copyWith(
          userName: event.userName,
          phoneNumber: event.phoneNumber,
        ),
      );
    });
  }
}
