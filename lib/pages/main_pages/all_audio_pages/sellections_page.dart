import 'package:audio_fairy_tales/pages/main_pages/all_audio_pages/widgets/appbar_all_audio.dart';
import 'package:audio_fairy_tales/pages/main_pages/all_audio_pages/widgets/list_all_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/list_item_block/list_item_block.dart';
import '../../../utils/constants.dart';

import '../../../widgets/player_widgets/player_collections.dart';
import 'bloc/bloc_anim/anim_bloc.dart';
import 'bloc/bloc_total_qual/total_bloc.dart';
import 'bloc/bloc_total_qual/total_event.dart';

class SellectionsPage extends StatelessWidget {
  const SellectionsPage({Key? key}) : super(key: key);
  static const routeName = '/audio_recordings_page';
  final bool shouldPop = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWight = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider<AnimBloc>(
          create: (context) => AnimBloc(),
        ),
        BlocProvider<ListItemBloc>(
          create: (context) => ListItemBloc()
            ..add(
              LoadListItemEvent(
                sort: 'all',
                collection: 'Collections',
                nameSort: 'collections',
              ),
            ),
        ),
        BlocProvider<QualityTotalTimeBloc>(
          create: (context) => QualityTotalTimeBloc()
            ..add(
              LoadQualityTotalTimeEvent(),
            ),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          return shouldPop;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
            elevation: 0.0,
            title: const Text(
              'Аудиозаписи',
              style: oneTitleTextStyle,
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: const [
                        ListPlayer(),
                        AppbarHeaderAudioRecordings(),
                      ],
                    ),
                  ],
                ),
              ),
              BlocBuilder<AnimBloc, AnimState>(
                builder: (_, state) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: PlayerCollections(
                        screenWight: screenWight,
                        screenHeight: screenHeight,
                        idCollection: 'all',
                        animation: state.anim,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
