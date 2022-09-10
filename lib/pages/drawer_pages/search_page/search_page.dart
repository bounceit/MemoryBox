import 'package:audio_fairy_tales/pages/drawer_pages/search_page/widgets/appbar_search.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/search_page/widgets/list_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants.dart';
import 'bloc/search_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = '/search_page';
  final bool shouldPop = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchPageBloc>(
      create: (context) => SearchPageBloc()
        ..add(
          const LoadSearchPageEvent(),
        ),
      child: WillPopScope(
        onWillPop: () async {
          return shouldPop;
        },
        child: Scaffold(
          appBar: AppBar(
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: const [
                  ListPlayersSearchPage(),
                  AppbarHeaderSearchPage(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
