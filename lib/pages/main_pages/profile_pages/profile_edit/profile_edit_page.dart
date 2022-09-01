import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_edit/photo_profile.dart';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_edit/profile_edit_page_model.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/repositories/preferences_data_user_rep.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../repositories/user_repositories.dart';
import '../../../../widgets/uncategorized/main_clip_path.dart';
import '../../../../widgets/uncategorized/text_input.dart';

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
    return ChangeNotifierProvider<ProfileEditPageModel>(
      create: (BuildContext context) => ProfileEditPageModel(),
      child: ProfileEditCreate(
        userName: userName,
        userImage: userImage,
        userNumber: userNumber,
      ),
    );
  }
}

class ProfileEditCreate extends StatelessWidget {
  const ProfileEditCreate({
    Key? key,
    required this.userName,
    required this.userNumber,
    required this.userImage,
  }) : super(key: key);
  final String userName;
  final String userNumber;
  final String userImage;
  void _saveChanges() {}
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Stack(
                  children: const [
                    MainClipPath(),
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
                      onTap: _saveChanges,
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
              context.read<ProfileEditPageModel>().setName(userName);
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
            context.read<ProfileEditPageModel>().setNumber(userNumber);
          },
        ),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  _SaveButton({
    Key? key,
    required this.userName,
    required this.userNumber,
    required this.userImage,
    required this.onTap,
  }) : super(key: key);
  final PreferencesDataUser _preferencesDataUser = PreferencesDataUser();
  final UserRepositories _repositories = UserRepositories();
  final String userName;
  final String userNumber;
  final String userImage;
  final VoidCallback onTap;
  Future<void> saveUser(BuildContext context) async {
    final String image =
        Provider.of<ProfileEditPageModel>(context, listen: false)
                .getSingleImage ??
            userImage;
    final String name =
        Provider.of<ProfileEditPageModel>(context, listen: false).getName ??
            userName;
    final String number =
        Provider.of<ProfileEditPageModel>(context, listen: false).getNumber ??
            userNumber;

    Navigator.pop(context, [
      name,
      number,
      image,
    ]);
    _preferencesDataUser.saveName(name);
    _preferencesDataUser.saveNumber(number);
    _repositories.updateNameNumber(name, number, image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        TextButton(
            onPressed: () => saveUser(context),
            child: const Text(
              'Сохранить',
              style: TextStyle(fontSize: 14, color: AppColors.colorText),
            ))
      ],
    );
  }
}
