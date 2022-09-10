import 'package:audio_fairy_tales/pages/drawer_pages/audio_delete_pages/widgets/appbar_delete_page.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/audio_delete_pages/widgets/list_delete_audio.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/audio_delete_pages/widgets/popmenu_delete_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/bloc_navigations/navigation_bloc.dart';
import '../../../blocs/list_item_block/list_item_block.dart';
import '../../../utils/constants.dart';
import 'bloc/delete_audio_cubbit.dart';

class DeletePage extends StatelessWidget {
  const DeletePage({Key? key}) : super(key: key);
  static const routeName = '/delete_page';
  final bool shouldPop = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListItemBloc>(
          create: (context) => ListItemBloc()
            ..add(
              LoadListItemEvent(
                sort: 'all',
                collection: 'DeleteCollections',
                nameSort: 'collections',
              ),
            ),
        ),
        BlocProvider<DeleteItemDoneCubit>(
          create: (context) => DeleteItemDoneCubit(),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          return shouldPop;
        },
        child: Scaffold(
          appBar: AppBar(
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
            actions: [
              PopupMenuDeletePage(),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: const [
                  ListPlayersDeletePage(),
                  AppbarHeaderDeletePage(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
