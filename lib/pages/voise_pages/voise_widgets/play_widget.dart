import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:audio_fairy_tales/pages/voise_pages/bloc/record_bloc.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../database/local_save_audio.dart';
import '../../../recursec/app_icons.dart';
import '../../../repositories/audio_firebase_repositories.dart';
import '../../../repositories/auth_repository.dart';
import '../../../repositories/user_repositories.dart';
import '../../../utils/constants.dart';
import '../../../widgets/uncategorized/slider.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({
    Key? key,
    required this.source,
    required this.onDelete,
  }) : super(key: key);
  final ap.AudioSource source;
  final VoidCallback onDelete;

  @override
  AudioPlayerState createState() => AudioPlayerState();
}

class AudioPlayerState extends State<AudioPlayer> {
  static const double _controlSize = 56;
  static const double _deleteBtnSize = 24;

  final _audioPlayer = ap.AudioPlayer();
  late StreamSubscription<ap.PlayerState> _playerStateChangedSubscription;
  late StreamSubscription<Duration?> _durationChangedSubscription;
  late StreamSubscription<Duration> _positionChangedSubscription;
  String _saveRecord = 'Аудиофайл';
  bool _isPlay = false;
  bool _isPaused = false;
  Timer? _timer;
  int _recordDuration = 0;
  final Set searchName = {};

  @override
  void initState() {
    _playerStateChangedSubscription =
        _audioPlayer.playerStateStream.listen((state) async {
      if (state.processingState == ap.ProcessingState.completed) {
        await stop();
      }
      setState(() {});
    });
    _positionChangedSubscription = _audioPlayer.positionStream.listen(
      (position) => setState(() {}),
    );
    _durationChangedSubscription = _audioPlayer.durationStream.listen(
      (duration) => setState(() {}),
    );
    _init();

    super.initState();
  }

  Future<void> _init() async {
    await _audioPlayer.setAudioSource(widget.source);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _playerStateChangedSubscription.cancel();
    _positionChangedSubscription.cancel();
    _durationChangedSubscription.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> shareAudio(BuildContext context, state) async {
    Directory directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/$_saveRecord.mp3';
    File file = File(filePath);
    File fileTemp = File(state.path);
    bool isExist = await file.exists();
    if (!isExist) {
      await file.create();
    }
    Uint8List rat = await fileTemp.readAsBytes();
    await file.writeAsBytes(rat);
    await Share.shareFiles(
      [filePath],
    );
  }

  Future<void> logicSave(state) async {
    if (AuthRepositories.instance.user == null) {
      saveRecordLocal(state);
    } else {
      await FirebaseFirestore.instance
          .collection(AuthRepositories.instance.user!.phoneNumber!)
          .get()
          .then((querySnapshot) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> result
            in querySnapshot.docs) {
          final bool subscription = result.data()['subscription'] ?? true;
          AuthRepositories.instance.user == null
              ? saveRecordLocal(state)
              : subscription
                  ? saveRecordsFirebase(state)
                  : saveRecordLocal(state);
        }
      });
    }
  }

  void saveRecordLocal(state) {
    LocalSaveAudioFile.instance.saveAudioStorageDirectory(
      context,
      state.path,
      _saveRecord,
    );
    _audioPlayer.stop().then(
          (value) => widget.onDelete(),
        );
  }

  Future<void> saveRecordsFirebase(state) async {
    _audioPlayer.stop().then(
          (value) => widget.onDelete(),
        );
    await AudioRepositories.instance.addAudio(
      state.path,
      _saveRecord,
      '${state.minutes}:${state.seconds}',
      searchName,
    );
    await UserRepositories.instance.updateTotalTimeQuality();
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
    return _audioPlayer.seek(
      const Duration(
        milliseconds: 0,
      ),
    );
  }

  void _startTimer() {
    _timer?.cancel();
    // _ampTimer?.cancel();

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
              setState(() {});
            } else {
              setState(() {});
              play();
            }
          },
        ),
      ),
    );
  }

  Widget _buildSlider(double widgetWidth) {
    final position = _audioPlayer.position;
    final duration = _audioPlayer.duration;
    bool canSetValue = false;
    if (duration != null) {
      canSetValue = position.inMilliseconds > 0;
      canSetValue &= position.inMilliseconds < duration.inMilliseconds;
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
              _audioPlayer.seek(
                Duration(
                  milliseconds: position.round(),
                ),
              );
            }
          },
          value: canSetValue && duration != null
              ? position.inMilliseconds / duration.inMilliseconds
              : 0.0,
        ),
      ),
    );
  }

  Widget _buildText() {
    if (_isPlay || _isPaused) {
      return _buildTimer();
    }

    return const Text(
      '00:00',
    );
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(
      _recordDuration ~/ 60,
    );
    final String seconds = _formatNumber(
      _recordDuration % 60,
    );
    return Text(
      '$minutes : $seconds',
    );
  }

  Widget _icon(state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              IconButton(
                onPressed: () => shareAudio(
                  context,
                  state,
                ),
                icon: Image.asset(
                  AppIcons.recUpload,
                ),
              ),
              IconButton(
                onPressed: () => saveRecordLocal(state),
                icon: Image.asset(
                  AppIcons.recPaperDownload,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
              ),
              IconButton(
                onPressed: () => _audioPlayer.stop().then(
                      (value) => widget.onDelete(),
                    ),
                icon: Image.asset(
                  AppIcons.recDelete,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 35.0,
          ),
          child: TextButton(
            onPressed: () => logicSave(state),
            child: const Text(
              'Сохранить',
              style: sevenTitleTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordingsPageBloc, RecordingsPageState>(
      builder: (_, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _icon(state),
                const SizedBox(
                  height: 75.0,
                ),
                SizedBox(
                  width: 200.0,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Аудиофайл',
                      hintStyle: TextStyle(
                        fontSize: 24.0,
                        color: AppColors.colorText,
                      ),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24.0,
                    ),
                    onChanged: (value) {
                      _saveRecord = value;
                      final data = value.toLowerCase();
                      searchName.add(data);
                      if (data != searchName.last) {
                        searchName.remove(searchName.last);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                _buildSlider(constraints.maxWidth),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildText(),
                      Text('${state.minutes}:${state.seconds}'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await _audioPlayer.seek(
                          Duration(
                              seconds: _audioPlayer.position.inSeconds - 15),
                        );
                        _recordDuration - 15;
                      },
                      icon: const Icon(
                        Icons.replay_10,
                      ),
                    ),
                    _buildControl(),
                    IconButton(
                      onPressed: () async {
                        await _audioPlayer.seek(
                          Duration(
                              seconds: _audioPlayer.position.inSeconds + 15),
                        );
                        _recordDuration + 15;
                      },
                      icon: const Icon(
                        Icons.forward_10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
