import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc_navigations/navigation_state.dart';
import '../../blocs/list_item_block/list_item_block.dart';
import '../../widgets/main_page_widgets/popup_home_menu.dart';
import '../../widgets/navigation/navigate_to_page.dart';
import '../../widgets/player_widgets/player_mini.dart';
import '../main_pages/all_audio_pages/sellections_page.dart';

class HomePageAudio extends StatelessWidget {
  const HomePageAudio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(
                0.0,
                -5.0,
              ),
              blurRadius: 10.0,
            )
          ]),
      child: Container(
        decoration: borderContainer2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Expanded(
              flex: 2,
              child: _TitleAudioList(),
            ),
            Expanded(
              flex: 8,
              child: _AudioList(),
            )
          ],
        ),
      ),
    );
  }
}

class _AudioList extends StatelessWidget {
  const _AudioList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child:
          BlocBuilder<ListItemBloc, ListItemState>(builder: (context, state) {
        if (state.status == ListItemStatus.emptyList) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 50.0,
              horizontal: 40.0,
            ),
            child: Text(
              'Как только ты запишешь аудио, она появится здесь.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: AppColors.colorText50,
              ),
            ),
          );
        }
        if (state.status == ListItemStatus.success) {
          return ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (BuildContext context, int index) {
              final audio = state.list[index];
              return PlayerMini(
                duration: '${audio.duration}',
                url: '${audio.audioUrl}',
                name: '${audio.audioName}',
                done: audio.done!,
                id: '${audio.id}',
                collection: audio.collections!,
                popupMenu: PopupMenuHomePage(
                  url: '${audio.audioUrl}',
                  duration: '${audio.duration}',
                  name: '${audio.audioName}',
                  image: '',
                  done: audio.done!,
                  searchName: audio.searchName!,
                  dateTime: audio.dateTime!,
                  idAudio: '${audio.id}',
                  collection: audio.collections!,
                ),
              );
            },
          );
        }
        if (state.status == ListItemStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == ListItemStatus.failed) {
          return const Center(
            child: Text(
              'Ой: сталася помилка!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: AppColors.colorText50,
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}

class _TitleAudioList extends StatelessWidget {
  const _TitleAudioList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<NavigationBloc, NavigationState>(
    //   builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Аудиозаписи',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          GestureDetector(
            onTap: () => NavigateToPage.instance?.navigate(context,
                index: 3,
                currentIndex: const NavigationState().currentIndex,
                route: SellectionsPage.routeName),
            child: const Text(
              'Открыть все',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          )
        ],
      ),
    );
    //   },
    // );
  }
}
