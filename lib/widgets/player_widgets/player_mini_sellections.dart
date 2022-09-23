import 'dart:async';

import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as ap;
import '../../pages/main_pages/collections_pages/collections_add_audio/widgets/done_widget.dart';
import '../../recursec/app_icons.dart';

class PlayerMiniPodborki extends StatefulWidget {
  const PlayerMiniPodborki({
    Key? key,
    required this.url,
    required this.name,
    required this.duration,
    required this.done,
    required this.id,
    required this.collection,
    required this.titleCollections,
  }) : super(key: key);
  final String url;
  final String name;
  final String duration;
  final bool done;
  final String id;
  final List collection;
  final String titleCollections;

  @override
  State<PlayerMiniPodborki> createState() => _PlayerMiniPodborkiState();
}

class _PlayerMiniPodborkiState extends State<PlayerMiniPodborki> {
  late StreamSubscription<ap.PlayerState> _playerStateChangedSubscription;
  final player = ap.AudioPlayer();
  @override
  void initState() {
    _playerStateChangedSubscription =
        player.playerStateStream.listen((state) async {
      if (state.processingState == ap.ProcessingState.completed) {
        await stop();
      }
      setState(() {});
    });
    _init();
    super.initState();
  }

  @override
  void dispose() {
    _playerStateChangedSubscription.cancel();
    player.dispose();
    super.dispose();
  }

  Future<void> _init() async {
    await player.setUrl(widget.url);
  }

  Future<void> play() {
    return player.play();
  }

  Future<void> pause() {
    return player.pause();
  }

  Future<void> stop() async {
    await player.stop();
    return player.seek(
      const Duration(milliseconds: 0),
    );
  }

  Widget _buildControl() {
    Widget icon;

    if (player.playerState.playing) {
      icon = Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          AppIcons.stopPodborki,
          fit: BoxFit.fill,
        ),
      );
    } else {
      icon = Image.asset(
        AppIcons.playPodborki,
        fit: BoxFit.fill,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipOval(
        child: Material(
          child: InkWell(
            child: SizedBox(
              width: 55,
              height: 55,
              child: icon,
            ),
            onTap: () {
              if (player.playerState.playing) {
                pause();
                setState(() {});
              } else {
                setState(() {});
                play();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 10.0,
        bottom: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        height: 60.0,
        width: double.infinity,
        child: Row(
          children: [
            _buildControl(),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    '${widget.duration} минут',
                    style: const TextStyle(
                      color: AppColors.colorText50,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            DoneWidget(
              id: widget.id,
              done: widget.done,
              collection: widget.collection,
              titleCollections: widget.titleCollections,
            )
          ],
        ),
      ),
    );
  }
}
