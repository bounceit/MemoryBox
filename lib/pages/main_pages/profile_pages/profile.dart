import 'dart:io';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/name_and_number.dart';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/photo_profile.dart';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_edit/profile_edit_page.dart';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_model.dart';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/progress_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';
import '../../../models/view_model.dart';
import '../../../recursec/app_colors.dart';
import '../../../repositories/user_repositories.dart';
import '../../../utils/constants.dart';
import '../../../widgets/uncategorized/main_clip_path.dart';
import '../../../widgets/uncategorized/text_link.dart';
import 'delete_profile.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  static const routeName = '/profile';
  final DataModel model = DataModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataModel>(
      create: (BuildContext context) => DataModel(),
      child: ProfileCreate(),
    );
  }
}

class ProfileCreate extends StatelessWidget {
  ProfileCreate({Key? key}) : super(key: key);
  final UserRepositories _rep = UserRepositories();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white100,
      appBar: AppBar(
        backgroundColor: AppColors.violet,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Профиль',
          style: oneTitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: const [
                MainClipPath(),
                PhotoProfileProfile(),
              ],
            ),
            _rep.user == null
                ? _LinksNotAuthorization(
                    screenWidth: screenWidth,
                  )
                : _Links(
                    screenWidth: screenWidth,
                  ),
          ],
        ),
      ),
    );
  }
}

class _Links extends StatelessWidget {
  _Links({Key? key, required this.screenWidth}) : super(key: key);
  final UserRepositories repositoriesUser = UserRepositories();
  final _auth = FirebaseAuth.instance;
  final double screenWidth;
  Widget buildUser(UserModel model) => CustomProgressIndicator(
        size: model.totalSize ?? 0,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const NameAndNumber(),
        TextLink(
          onPressed: () async {
            final userName =
                Provider.of<DataModel>(context, listen: false).getName ?? '';
            final userImage =
                Provider.of<DataModel>(context, listen: false).getUserImage ??
                    '';
            final userNumber =
                Provider.of<DataModel>(context, listen: false).getNumber ?? '';
            List result = await Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return ProfileEdit(
                userName: userName,
                userImage: userImage,
                userNumber: userNumber,
              );
            }));
            if (result.isNotEmpty) {
              context.read<DataModel>().userName(result[0]);
              context.read<DataModel>().userNumber(result[1]);
              context.read<DataModel>().userImage(result[2]);
            }
          },
          text: 'Редактировать',
        ),
        const SizedBox(
          height: 70.0,
        ),
        TextLink(
          onPressed: () {
            Provider.of<Navigation>(context, listen: false).setCurrentIndex = 7;
          },
          underline: false,
          text: 'Подписка',
        ),
        const SizedBox(
          height: 15.0,
        ),
        StreamBuilder<List<UserModel>>(
          stream: repositoriesUser.readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const CustomProgressIndicator(
                size: 150,
              );
            }
            if (snapshot.hasData) {
              final user = snapshot.data!;
              if (user.map(buildUser).toList().isNotEmpty) {
                return Container(
                  child: user.map(buildUser).toList().single,
                );
              } else {
                return const CustomProgressIndicator(
                  size: 150,
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        const SizedBox(
          height: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextLink(
                text: 'Вийти из приложения',
                onPressed: () async {
                  await _auth.signOut();
                  exit(0);
                },
              ),
              DeleteAccount(),
            ],
          ),
        )
      ],
    );
  }
}

class _LinksNotAuthorization extends StatelessWidget {
  _LinksNotAuthorization({Key? key, required this.screenWidth})
      : super(key: key);
  final _auth = FirebaseAuth.instance;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const NameAndNumber(),
        TextLink(
          onPressed: () {
            Navigator.pushNamed(context, ProfileEdit.routeName);
          },
          text: 'Редактировать',
        ),
        const SizedBox(
          height: 40.0,
        ),
        TextLink(
          onPressed: () {
            Provider.of<Navigation>(context, listen: false).setCurrentIndex = 7;
          },
          underline: false,
          text: 'Подписка',
        ),
        const SizedBox(
          height: 15.0,
        ),
        const CustomProgressIndicator(
          size: 150,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextLink(
                text: 'Вийти из приложения',
                onPressed: () async {
                  await _auth.signOut();
                  exit(0);
                },
              ),
              // DeleteAccount(),
            ],
          ),
        )
      ],
    );
  }
}
