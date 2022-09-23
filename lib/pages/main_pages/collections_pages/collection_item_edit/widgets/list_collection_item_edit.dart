import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../blocs/list_item_block/list_item_block.dart';
import '../../../../../widgets/player_widgets/player_mini.dart';

class ListCollectionsAudioItemEdit extends StatelessWidget {
  const ListCollectionsAudioItemEdit({
    Key? key,
    required this.idCollection,
  }) : super(key: key);
  final String idCollection;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: BlocBuilder<ListItemBloc, ListItemState>(
            builder: (context, state) {
              if (state.status == ListItemStatus.emptyList) {
                return const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                  ),
                  child: Center(
                    child: Text(
                      'Как только ты добавишь аудио, оно появится здесь.',
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
                    bottom: 0.0,
                  ),
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
                      popupMenu: const Padding(
                        padding: EdgeInsets.only(
                          right: 16.0,
                        ),
                        child: Icon(
                          Icons.more_horiz,
                          color: AppColors.colorText,
                          size: 40.0,
                        ),
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
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
