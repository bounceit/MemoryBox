import 'package:audio_fairy_tales/pages/save_pages/bloc/save_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/audio_firebase_repositories.dart';
import '../../../utils/constants.dart';

class CancelDoneSavePage extends StatelessWidget {
  const CancelDoneSavePage({
    Key? key,
    required this.idAudio,
    required this.audioName,
    required this.audioUrl,
    required this.audioDuration,
    required this.audioDone,
    required this.audioTime,
    required this.audioSearchName,
    required this.audioCollection,
  }) : super(key: key);
  final String idAudio;
  final String audioName;
  final String audioUrl;
  final String audioDuration;
  final bool audioDone;
  final String audioTime;
  final List audioSearchName;
  final List audioCollection;

  void _finished(BuildContext context, state) {
    AudioRepositories.instance.renameAudio(
      idAudio,
      state.newAudioName ?? audioName,
      audioUrl,
      audioDuration,
      audioTime,
      state.newSearchName ?? audioSearchName,
      audioCollection,
      audioDone,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavePageBloc, SavePageState>(
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Отменить',
                    style: sevenTitleTextStyle,
                  )),
              TextButton(
                  onPressed: () => _finished(
                        context,
                        state,
                      ),
                  child: const Text(
                    'Готово',
                    style: sevenTitleTextStyle,
                  )),
            ],
          ),
        );
      },
    );
  }
}
