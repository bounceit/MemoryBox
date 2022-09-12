import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/widgets/main_page_widgets/popup_home_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/list_item_block/list_item_block.dart';
import '../../../../widgets/player_widgets/player_mini.dart';

class ListPlayer extends StatelessWidget {
  const ListPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight - (kBottomNavigationBarHeight + 85.0),
      child:
          BlocBuilder<ListItemBloc, ListItemState>(builder: (context, state) {
        if (state.status == ListItemStatus.emptyList) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 50.0,
              horizontal: 40.0,
            ),
            child: Center(
              child: Text(
                'Как только ты запишешь аудио, она появится здесь.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: AppColors.colorText50,
                ),
              ),
            ),
          );
        }
        if (state.status == ListItemStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == ListItemStatus.success) {
          return ListView.builder(
            padding: const EdgeInsets.only(
              top: 135.0,
              bottom: 110.0,
            ),
            itemCount: state.list.length,
            itemBuilder: (BuildContext context, int index) {
              final audio = state.list[index];
              return PlayerMini(
                playPause: audio.playPause ?? false,
                duration: '${audio.duration}',
                url: '${audio.audioUrl}',
                name: '${audio.audioName}',
                done: audio.done!,
                id: '${audio.id}',
                collection: audio.collections ?? [],
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
        if (state.status == ListItemStatus.failed) {
          return const Center(
            child: Text(
              'Ой: сталася помилка!',
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
