import 'package:audio_fairy_tales/pages/drawer_pages/search_page/search_page_model.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/search_page/widgets/appbar_search.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/search_page/widgets/list_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../recursec/app_colors.dart';
import '../../../utils/constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = '/search_page';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchPageModel>(
      create: (BuildContext context) => SearchPageModel(),
      child: const SavePageCreate(),
    );
  }
}

class SavePageCreate extends StatelessWidget {
  const SavePageCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorAppbar,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        elevation: 0.0,
        title: const Text(
          'Поиск',
          style: twoTitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ListPlayersSearchPage(),
                const AppbarHeaderSearchPage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
