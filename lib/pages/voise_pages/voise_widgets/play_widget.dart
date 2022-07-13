import 'dart:async';

import 'package:audio_fairy_tales/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:provider/provider.dart';

import '../../../recursec/app_colors.dart';
import '../../../recursec/app_icons.dart';

import '../../../repositories/audio_save_local.dart';
import '../../../repositories/user_repositories.dart';
import '../../../widgets/uncategorized/slider.dart';
import '../model_voise_page.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({
    Key? key,
    required this.source,
    required this.onDelete,
  }) : super(key: key);
  final ap.AudioSource source;
  final VoidCallback onDelete;

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayerWidget> {
  final UserRepositories _rep = UserRepositories();
  static const double _controlSize = 56;
  static const double _deleteBtnSize = 24;
  bool _isPlay = false;
  bool _isPaused = false;
  Timer? _timer;
  int _recordDuration = 0;
  final _audioPlayer = ap.AudioPlayer();
  String _saveRecord = 'Аудиофайл';
  late StreamSubscription<ap.PlayerState> _playerStateChangedSubscription;
  late StreamSubscription<Duration?> _durationChangedSubscription;
  late StreamSubscription<Duration> _positionChangedSubscription;

  @override
  void initState() {
    _playerStateChangedSubscription =
        _audioPlayer.playerStateStream.listen((state) async {
      if (state.processingState == ap.ProcessingState.completed) {
        await stop();
      }
      setState(() {});
    });
    _positionChangedSubscription =
        _audioPlayer.positionStream.listen((position) => setState(() {}));
    _durationChangedSubscription =
        _audioPlayer.durationStream.listen((duration) => setState(() {}));
    _init();

    super.initState();
  }

  Future<void> _init() async {
    await _audioPlayer.setAudioSource(widget.source);
  }

  void saveRecordLocal() {
    LocalSaveAudioFIle().saveAudioStorageDirectory(
      context,
      Provider.of<ModelRP>(context, listen: false).getData,
      _saveRecord,
    );
    _audioPlayer.stop().then((value) => widget.onDelete());
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
        const SizedBox(width: 35),
        TextButton(
          onPressed: saveRecordLocal,
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
        child: Image.asset(
          'assets/images/playR.png',
          fit: BoxFit.fill,
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

    return const Text('00:00');
  }

  Widget _buildTimer() {
    final String minutes = _formatNumberTwo(_recordDuration ~/ 60);
    final String seconds = _formatNumberTwo(_recordDuration % 60);
    return Text(
      '$minutes : $seconds',
    );
  }

  String _formatNumberTwo(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  Widget _buildSlider(double widgetWidth) {
    final position = _audioPlayer.position;
    final duration = _audioPlayer.duration;
    bool isSetValue = false;
    if (duration != null) {
      isSetValue = position.inMilliseconds > 0;
      isSetValue &= position.inMilliseconds < duration.inMilliseconds;
    }
    double width = widgetWidth - _controlSize - _deleteBtnSize;
    width -= _deleteBtnSize;

    return SizedBox(
      width: width * 2,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbShape: const RoundedAmebaThumbShape(
            radius: 8,
            color: AppColors.colorText,
          ),
          thumbColor: AppColors.colorText,
          inactiveTrackColor: AppColors.colorText,
          activeTrackColor: AppColors.colorText,
        ),
        child: Slider(
          onChanged: (v) {
            if (duration != null) {
              final position = v * duration.inMilliseconds;
              _audioPlayer.seek(Duration(milliseconds: position.round()));
            }
          },
          value: isSetValue && duration != null
              ? position.inMilliseconds / duration.inMilliseconds
              : 0.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _icon(),
          _buildSlider(constraints.maxWidth),
          Consumer<ModelRP>(builder: (context, ModelRP modelRP, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildText(),
                Text(modelRP.getDuration),
              ],
            );
          }),
          _buildControl(),
          const SizedBox(height: 75),
        ],
      );
    });
  }
}
