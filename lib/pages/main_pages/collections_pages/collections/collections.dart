import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections/widgets/appbar_collections.dart';
import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections/widgets/list_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocks/bloc/list_item_collections_bloc.dart';
import 'blocks/item_done_cubit.dart';

class Collections extends StatelessWidget {
  const Collections({Key? key}) : super(key: key);
  static const routeName = '/collection';
  final bool shouldPop = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ItemDoneCubit>(
          create: (context) => ItemDoneCubit(),
        ),
        BlocProvider<ListItemCollectionBloc>(
          create: (context) => ListItemCollectionBloc()
            ..add(
              const LoadListItemCollectionEvent(),
            ),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          return shouldPop;
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: const [
                AppbarHeaderCollection(),
                ListCollections(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
