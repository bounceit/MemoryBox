import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../repositories/user_repositories.dart';
import '../../../../../../widgets/uncategorized/image_picker.dart';

part 'image_state.dart';

class GetImageProfileCubit extends Cubit<GetImageProfileState> {
  GetImageProfileCubit()
      : super(
          const GetImageProfileState(),
        );
  final ImagePick _imagePick = ImagePick();
  Future<void> getImage() async {
    String? singleImage;
    XFile? image = await _imagePick.singleImagePick();
    if (image != null && image.path.isNotEmpty) {
      singleImage = await UserRepositories.instance.uploadImage(image);
      emit(
        state.copyWith(
          image: singleImage,
        ),
      );
    }
  }
}
