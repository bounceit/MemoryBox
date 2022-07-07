import 'dart:async';

import 'package:audio_fairy_tales/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:provider/provider.dart';

import '../../../recursec/app_icons.dart';
import '../model_voise_page.dart';

class AudioPlayerWidget extends StatefulWidget {
  final ap.AudioSource source;
  const AudioPlayerWidget({
    required this.source,
  });

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayerWidget> {
  bool _isPlay = false;
  bool _isPaused = false;
  Timer? _timer;
  int _recordDuration = 0;
  final _audioPlayer = ap.AudioPlayer();

  @override
  void initState() {
    _init();

    super.initState();
  }

  Future<void> _init() async {
    bool _isPlay = false;
    await _audioPlayer.setAudioSource(widget.source);
  }

  Widget _icon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(AppIcons.recUpload),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(AppIcons.recPaperDownload),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0)),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(AppIcons.recDelete),
                  padding: const EdgeInsets.symmetric(horizontal: 15)),
            ],
          ),
        ),
        SizedBox(width: 35),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Сохранить',
            style: bodyTextStyle,
          ),
        ),
      ],
    );
  }

  Future<void> play() {
    setState(() => _isPlay = true);
    _startTimer();
    return _audioPlayer.play();
  }

  Future<void> pause() {
    setState(() => _isPaused = true);
    _timer?.cancel();
    return _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    _timer?.cancel();
    setState(() => _recordDuration = 0);
    return _audioPlayer.seek(const Duration(milliseconds: 0));
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }

  Widget _buildControl() {
    Widget icon;

    if (_audioPlayer.playerState.playing) {
      icon = Image.asset(
        AppIcons.stop,
        fit: BoxFit.fill,
      );
    } else {
      icon = Container(
        color: Colors.transparent,
        child: Expanded(
          child: Image.asset(
            'assets/images/playR.png',
            fit: BoxFit.fill,
          ),
        ),
      );
    }

    return ClipOval(
      child: Material(
        child: InkWell(
          child: SizedBox(
            width: 80,
            height: 80,
            child: icon,
          ),
          onTap: () {
            if (_audioPlayer.playerState.playing) {
              pause();
            } else {
              play();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  Widget _buildText() {
    if (_isPlay || _isPaused) {
      return _buildTimer();
    }

    return Text('00:00');
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);
    return Text(
      '$minutes : $seconds',
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0' + numberStr;
    }

    return numberStr;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _icon(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildText(),
            Text('${Provider.of<ModelRP>(context, listen: false).getDuration}'),
          ],
        ),
        _buildControl(),
      ],
    );
  }
}
