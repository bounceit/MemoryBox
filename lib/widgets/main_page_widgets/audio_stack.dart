import 'package:flutter/material.dart';

import '../../models/audio_model.dart';
import '../../recursec/app_colors.dart';
import '../../repositories/audio_firebase_repositories.dart';
import '../../repositories/user_repositories.dart';
import '../player_widgets/player_mini.dart';

class AudioStackWidget extends StatelessWidget {
  const AudioStackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset.fromDirection(1),
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
          color: AppColors.white100,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Аудиозаписи',
                    style: TextStyle(
                      color: Color.fromRGBO(58, 58, 85, 1),
                      fontFamily: 'TTNorms',
                      fontSize: 24,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Открыть все',
                    style: TextStyle(
                      color: Color.fromRGBO(58, 58, 85, 1),
                      fontFamily: 'TTNorms',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AudioListWidget(),
          ),
        ],
      ),
    );
  }
}

class AudioListWidget extends StatelessWidget {
  AudioListWidget({Key? key}) : super(key: key);
  final AudioRepositories repositories = AudioRepositories();

  Widget buildAudio(AudioModel audio) => PlayerMini(
        duration: '${audio.duration}',
        url: '${audio.audioUrl}',
        name: '${audio.audioName}',
        done: audio.done!,
        id: '${audio.id}',
        collection: audio.collections!,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: StreamBuilder<List<AudioModel>>(
        stream: repositories.readAudioSort('all'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 50.0,
                horizontal: 40.0,
              ),
              child: Text(
                'Как только ты запишешь аудио, она появится здесь',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: AppColors.colorText50,
                ),
              ),
            );
          }
          if (snapshot.hasData) {
            final audio = snapshot.data!;
            if (audio.map(buildAudio).toList().isEmpty) {
              UserRepositories().firstAuthorization();
              return const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 50.0,
                  horizontal: 40.0,
                ),
                child: Text(
                  'Как только ты запишешь аудио, она появится здесь!.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: AppColors.colorText50,
                  ),
                ),
              );
            }

            return ListView(
              children: audio.map(buildAudio).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
