import 'dart:async';

import 'package:audio_fairy_tales/animations/all_audio_player_anim/player_all_audio_model.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../recursec/app_icons.dart';

class AudioRecordingsPagePlayer extends StatefulWidget {
  const AudioRecordingsPagePlayer({
    Key? key,
  }) : super(key: key);

  @override
  State<AudioRecordingsPagePlayer> createState() =>
      _AudioRecordingsPagePlayerState();
}

class _AudioRecordingsPagePlayerState extends State<AudioRecordingsPagePlayer>
    with TickerProviderStateMixin {
  bool playPause = true;
  late AnimationController controller;
  late Animation animation;
  Timer? _timerAmplitude;
  // late Animation animation;

  void animPlus() {
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _timerAmplitude!.cancel();
      }
    });
  }

  void animMinus() {
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInQuart);
    controller.reverse(from: 1);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _timerAmplitude!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        playPause = !playPause;
        if (!playPause) {
          animPlus();
        }
        if (playPause) {
          animMinus();
        }

        _timerAmplitude =
            Timer.periodic(const Duration(milliseconds: 5),(_) {
          context
              .read<AudioRecordingsPagePlayerModel>()
              .setAnim(animation.value);
        });
        setState(() {});
      },
      child: Stack(
        children: [
          Container(
            height: 46.0,
            width: 200.0,
            decoration: BoxDecoration(
                color: playPause
                    ? const Color(0x50F6F6F6)
                    : const Color(0x20F6F6F6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50.0),
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: Image.asset(
                    AppIcons.vector,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 46.0,
            width: 150.0,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                )),
            child: Padding(
              padding: const EdgeInsets.only(right: 1.0, top: 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: Image.asset(
                      AppIcons.playAud,
                    ),
                  ),
                  const Text(
                    'Запустить все',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.blue100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
