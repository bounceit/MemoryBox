import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_edit_page/widgets/appbar_profile_edit.dart';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_edit_page/widgets/photo_profile.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/preferences_data_user_rep.dart';
import '../../../../repositories/user_repositories.dart';
import '../../../../widgets/uncategorized/text_input.dart';
import 'bloc/Image_bloc/image_cubbit.dart';
import 'bloc/profile_edit_bloc.dart';

class ProfileEditArguments {
  ProfileEditArguments(this.userName, this.userNumber, this.userImage);
  final String userName;
  final String userNumber;
  final String userImage;
}

class ProfileEdit extends StatelessWidget {
  const ProfileEdit(
      {Key? key,
      required this.userName,
      required this.userNumber,
      required this.userImage})
      : super(key: key);
  static const routeName = '/profile_edit';
  final String userName;
  final String userNumber;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileEditBloc>(
          create: (context) => ProfileEditBloc(),
        ),
        BlocProvider<GetImageProfileCubit>(
          create: (context) => GetImageProfileCubit(),
        ),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Stack(
                    children: const [
                      AppbarHeaderProfileEdit(),
                      PhotoProfileEdit(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const _TextFieldName(),
                      const _TextFieldNumber(),
                      _SaveButton(
                        userName: userName,
                        userImage: userImage,
                        userNumber: userNumber,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextFieldName extends StatelessWidget {
  const _TextFieldName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40.0,
        ),
        SizedBox(
          width: 200.0,
          height: 40.0,
          child: TextField(
            onChanged: (userName) {
              context.read<ProfileEditBloc>().add(
                    ProfileEditEvent(
                      userName: userName,
                    ),
                  );
            },
            style: const TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _TextFieldNumber extends StatelessWidget {
  const _TextFieldNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 80.0,
        ),
        TextFieldInput(
          onChanged: (userNumber) {
            context.read<ProfileEditBloc>().add(
                  ProfileEditEvent(
                    phoneNumber: userNumber,
                  ),
                );
          },
        ),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    Key? key,
    required this.userName,
    required this.userNumber,
    required this.userImage,
  }) : super(key: key);
  final String userName;
  final String userNumber;
  final String userImage;

  Future<void> saveUser(BuildContext context, state, stateImage) async {
    final String image = stateImage.image ?? userImage;
    final String name = state.userName ?? userName;
    final String number = state.phoneNumber ?? userNumber;

    Navigator.pop(context, [
      name,
      number,
      image,
    ]);
    PreferencesDataUser.instance.saveName(name);
    PreferencesDataUser.instance.saveNumber(number);
    PreferencesDataUser.instance.saveImage(image);
    UserRepositories.instance.updateNameNumber(name, number, image);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetImageProfileCubit, GetImageProfileState>(
      builder: (_, stateImage) {
        return BlocBuilder<ProfileEditBloc, ProfileEditState>(
          builder: (_, state) {
            return Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                    onPressed: () => saveUser(context, state, stateImage),
                    child: const Text(
                      'Сохранить',
                      style:
                          TextStyle(fontSize: 14, color: AppColors.colorText),
                    ))
              ],
            );
          },
        );
      },
    );
  }
}
