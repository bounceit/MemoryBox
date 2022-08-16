import 'dart:io';

import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_model.dart';
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

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  static const routeName = '/profile';
  final DataModel model = DataModel();
  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => DataModel(),
      child: const ProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataModel>(
      create: (BuildContext context) => DataModel(),
      child: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _VoicePageState();
}

class _VoicePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: AppColors.violet,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu,
          ),
          color: AppColors.white100,
          iconSize: 30,
        ),
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Профиль',
          style: twoTitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: const [
                MainClipPath(),
                Text(
                  'Твоя частичка',
                  style: threeTitleTextStyle,
                ),
                PhotoProfileProfile(),
              ],
            ),
            // _rep.user == null
            //     ? _LinksNotAuthorization(
            //         screenWidth: screenWidth,
            //       )
            //     : _Links(
            //         screenWidth: screenWidth,
            //       ),
          ],
        ),
      ),
    );
  }
}

class PhotoProfileProfile extends StatelessWidget {
  const PhotoProfileProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? image = context.watch<DataModel>().getUserImage!;
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            SizedBox(
                width: 200.0,
                height: 200.0,
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    child: image == 'assets/images/profile_avatar.png'
                        ? Image.asset(
                            image,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            context.watch<DataModel>().getUserImage!,
                            fit: BoxFit.cover,
                          ))),
          ],
        ),
      ),
    );
  }
}
// class _Links extends StatelessWidget {
//   _Links({Key? key, required this.screenWidth}) : super(key: key);
//   final UserRepositories repositoriesUser = UserRepositories();
//   final _auth = FirebaseAuth.instance;
//   final double screenWidth;
//   Widget buildUser(UserModel model) => CustomProgressIndicator(
//         size: model.totalSize ?? 0,
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         NameAndNumber(screenWidth: screenWidth * 0.75),
//         TextLink(
//           onPressed: () async {
//             final userName =
//                 Provider.of<DataModel>(context, listen: false).getName ?? '';
//             final userImage =
//                 Provider.of<DataModel>(context, listen: false).getUserImage ??
//                     '';
//             final userNumber =
//                 Provider.of<DataModel>(context, listen: false).getNumber ?? '';
//             List result = await Navigator.push(context,
//                 MaterialPageRoute(builder: (context) {
//               return ProfileEdit(
//                 userName: userName,
//                 userImage: userImage,
//                 userNumber: userNumber,
//               );
//             }));
//             if (result.isNotEmpty) {
//               context.read<DataModel>().userName(result[0]);
//               context.read<DataModel>().userNumber(result[1]);
//               context.read<DataModel>().userImage(result[2]);

//               print(result);
//             }
//           },
//           text: 'Редактировать',
//         ),
//         const SizedBox(
//           height: 40.0,
//         ),
//         TextLink(
//           onPressed: () {
//             Provider.of<Navigation>(context, listen: false).setCurrentIndex = 7;
//           },
//           underline: false,
//           text: 'Подписка',
//         ),
//         const SizedBox(
//           height: 15.0,
//         ),
//         StreamBuilder<List<UserModel>>(
//           stream: repositoriesUser.readUser(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return const CustomProgressIndicator(
//                 size: 150,
//               );
//             }
//             if (snapshot.hasData) {
//               final user = snapshot.data!;
//               if (user.map(buildUser).toList().isNotEmpty) {
//                 return Container(
//                   child: user.map(buildUser).toList().single,
//                 );
//               } else {
//                 return const CustomProgressIndicator(
//                   size: 150,
//                 );
//               }
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//         const SizedBox(
//           height: 15.0,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextLink(
//                 text: 'Вийти из приложения',
//                 onPressed: () async {
//                   await _auth.signOut();
//                   exit(0);
//                 },
//               ),

//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
