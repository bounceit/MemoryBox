import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/main_pages/collections_pages/collection_item/bloc/collection_item_bloc.dart';
import '../../recursec/app_icons.dart';
import '../../utils/constants.dart';

class ButtonPlayPause extends StatefulWidget {
  const ButtonPlayPause({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonPlayPause> createState() => _ButtonPlayPauseState();
}

class _ButtonPlayPauseState extends State<ButtonPlayPause>
    with TickerProviderStateMixin {
  bool playPause = true;
  late AnimationController controller;
  late Animation animation;
  Timer? _timerAmplitude;

  void animPlus() {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _timerAmplitude!.cancel();
      }
    });
  }

  void animMinus() {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInQuart,
    );
    controller.reverse(
      from: 1,
    );
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
            Timer.periodic(const Duration(milliseconds: 1), (_) async {
          context.read<CollectionItemAnimBloc>().add(
                CollectionItemAnimEvent(
                  anim: animation.value,
                ),
              );
        });
        setState(() {});
      },
      child: SizedBox(
        width: 168.0,
        height: 48.0,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.75,
              child: Container(
                width: 168.0,
                height: 48.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Image.asset(
                    playPause ? AppIcons.playWhite : AppIcons.pauseWhite,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      playPause ? 'Запустить все' : 'Остановить',
                      style: threeTitleTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
