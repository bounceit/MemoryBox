import 'package:audio_fairy_tales/animations/all_audio_player_anim/all_audio_player.dart';
import 'package:audio_fairy_tales/custom_shape.dart';
import 'package:audio_fairy_tales/pages/main_pages/all_audio_pages/bloc/bloc_total_qual/total_bloc.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/user_model.dart';
import '../../../../utils/constants.dart';
import '../bloc/bloc_total_qual/total_state.dart';

class AppbarHeaderAudioRecordings extends StatelessWidget {
  const AppbarHeaderAudioRecordings({Key? key}) : super(key: key);

  Widget buildCollections(UserModel model) => _QualityTotalTime(
        quality: model.totalQuality ?? 0,
        totalTime: model.totalTime ?? '00:00',
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
        ClipPath(
          clipper: Customshape(),
          child: Container(
            color: AppColors.colorAppbar,
            width: double.infinity,
            height: 165.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Все в одном месте',
              style: threeTitleTextStyle,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<QualityTotalTimeBloc, QualityTotalTimeState>(
                builder: (context, state) {
                  if (state.status == QualityTotalTimeStatus.initial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state.status == QualityTotalTimeStatus.failed) {
                    return const _QualityTotalTime(
                      totalTime: '??:??',
                      quality: 0,
                    );
                  }
                  if (state.status == QualityTotalTimeStatus.success) {
                    if (state.qualityTotalTime.isNotEmpty) {
                      final user = state.qualityTotalTime.last;
                      return _QualityTotalTime(
                        quality: user.totalQuality ?? 0,
                        totalTime: user.totalTime,
                      );
                    } else {
                      return const SizedBox();
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
        )
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
