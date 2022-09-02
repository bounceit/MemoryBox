import 'package:audio_fairy_tales/pages/drawer_pages/audio_delete_pages/audio_delete_model.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/audio_delete_pages/widgets/appbar_delete_page.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/audio_delete_pages/widgets/list_delete_audio.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/audio_delete_pages/widgets/popmenu_delete_page.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../repositories/user_repositories.dart';
import '../../../utils/constants.dart';

class DeletePage extends StatelessWidget {
  DeletePage({Key? key}) : super(key: key);
  static const routeName = '/delete_page';

  final UserRepositories rep = UserRepositories();
  static Widget create() {
    return ChangeNotifierProvider<DeletePageModel>(
      create: (BuildContext context) => DeletePageModel(),
      child: DeletePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorAppbar,
        // centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        elevation: 0.0,
        centerTitle: true,

        title: const Text(
          'Недавно',
          style: twoTitleTextStyle,
        ),
        actions: [PopupMenuDeletePage()],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                ListPlayersDeletePage(),
                const AppbarHeaderDeletePage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
