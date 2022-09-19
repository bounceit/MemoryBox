import 'package:audio_fairy_tales/custom_shape.dart';
import 'package:audio_fairy_tales/pages/save_pages/bloc/save_page_bloc.dart';
import 'package:audio_fairy_tales/pages/save_pages/widgets/cansel_done_audio_name.dart';
import 'package:audio_fairy_tales/pages/save_pages/widgets/rename_audio_save_page.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/player_widgets/player_big.dart';

class SavePageArguments {
  SavePageArguments(
    this.idAudio,
    this.audioName,
    this.audioImage,
    this.audioUrl,
    this.audioDuration,
    this.audioDone,
    this.audioTime,
    this.audioSearchName,
    this.audioCollection,
  );
  final String idAudio;
  final String audioName;
  final String audioImage;
  final String audioUrl;
  final String audioDuration;
  final bool audioDone;
  final String audioTime;
  final List audioSearchName;
  final List audioCollection;
}

class SavePage extends StatelessWidget {
  const SavePage({
    Key? key,
    required this.audioImage,
    required this.audioUrl,
    required this.audioDuration,
    required this.audioName,
    required this.idAudio,
    required this.audioDone,
    required this.audioTime,
    required this.audioSearchName,
    required this.audioCollection,
  }) : super(key: key);
  static const routeName = '/save_page';
  final String idAudio;
  final String audioName;
  final String audioImage;
  final String audioUrl;
  final String audioDuration;
  final bool audioDone;
  final String audioTime;
  final List audioSearchName;
  final List audioCollection;

  Widget? photoCollections(double screenWidth, double screenHeight) {
    if (audioImage == '') {
      return SizedBox(
        height: screenHeight * 0.35,
      );
    } else {
      return ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        child: SizedBox(
          width: screenWidth * 0.8,
          height: screenHeight * 0.35,
          child: Image.network(
            audioImage,
            fit: BoxFit.fill,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider<SavePageBloc>(
      create: (context) => SavePageBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.905,
                  ),
                  ClipPath(
                    clipper: Customshape(),
                    child: Container(
                      color: AppColors.colorAppbar,
                      width: double.infinity,
                      height: 250.0,
                    ),
                  ),
                  Positioned(
                    left: 5.0,
                    top: 40.0,
                    child: Container(
                      height: 900.0,
                      width: screenWidth * 0.97,
                      decoration: kBorderContainer2,
                      child: Column(
                        children: [
                          CancelDoneSavePage(
                            audioUrl: audioUrl,
                            audioDone: audioDone,
                            audioCollection: audioCollection,
                            idAudio: idAudio,
                            audioName: audioName,
                            audioDuration: audioDuration,
                            audioTime: audioTime,
                            audioSearchName: audioSearchName,
                          ),
                          photoCollections(
                            screenWidth,
                            screenHeight,
                          )!,
                          const SizedBox(
                            height: 30.0,
                          ),
                          RenameAudioSavePage(
                            audioName: audioName,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          PlayerBig(
                            url: audioUrl,
                            duration: audioDuration,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
