import 'package:audio_fairy_tales/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../animations/all_audio_player_anim/all_audio_player.dart';
import '../../animations/all_audio_player_anim/player_all_audio_model.dart';
import '../../models/audio_model.dart';
import '../../models/user_model.dart';
import '../../recursec/app_colors.dart';
import '../../repositories/audio_firebase_repositories.dart';
import '../../repositories/user_repositories.dart';
import '../../widgets/main_page_widgets/popup_home_menu.dart';
import '../../widgets/player_widgets/player_mini.dart';
import '../../widgets/uncategorized/audio_clip_shape.dart';

class SellectionsPage extends StatefulWidget {
  const SellectionsPage({Key? key}) : super(key: key);
  static const routeName = '/selection_page';
  static Widget create() {
    return ChangeNotifierProvider<AudioRecordingsPagePlayerModel>(
      create: (BuildContext context) => AudioRecordingsPagePlayerModel(),
      child: const SellectionsPage(),
    );
  }

  @override
  State<SellectionsPage> createState() => _SellectionsPage();
}

class _SellectionsPage extends State<SellectionsPage> {
  final UserRepositories repositories = UserRepositories();

  Widget buildCollections(UserModel model) => _QualityTotalTime(
        quality: model.totalQuality ?? 0,
        totalTime: model.totalTime ?? '00:00',
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: AppColors.audioAppBar,
        title: const Text(
          'Аудиозаписи',
          style: twoTitleTextStyle,
        ),
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
              ),
              color: AppColors.white100,
              iconSize: 30,
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          ListPlayer(),
          const AudioShape(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Все в одном месте',
                style: twoTitleTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 10.0,
              right: 10.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StreamBuilder<List<UserModel>>(
                  stream: repositories.readUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    }
                    if (snapshot.hasData) {
                      final collections = snapshot.data!;
                      if (collections
                          .map(buildCollections)
                          .toList()
                          .isNotEmpty) {
                        return Container(
                          child:
                              collections.map(buildCollections).toList().last,
                        );
                      } else {
                        return Container();
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                const AudioRecordingsPagePlayer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListPlayer extends StatelessWidget {
  ListPlayer({Key? key}) : super(key: key);
  final AudioRepositories repositories = AudioRepositories();
  Widget buildAudio(AudioModel audio) => PlayerMini(
        playPause: audio.playPause,
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

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.81,
          child: StreamBuilder<List<AudioModel>>(
            stream: repositories.readAudioSort('all'),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                final audio = snapshot.data!;
                return ListView(
                  padding: const EdgeInsets.only(top: 127, bottom: 190),
                  children: audio.map(buildAudio).toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class _QualityTotalTime extends StatelessWidget {
  const _QualityTotalTime({
    Key? key,
    required this.quality,
    required this.totalTime,
  }) : super(key: key);
  final int quality;
  final String totalTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$quality аудио',
          style: threeTitleTextStyle,
        ),
        Text(
          '$totalTime часов',
          style: threeTitleTextStyle,
        ),
      ],
    );
  }
}
